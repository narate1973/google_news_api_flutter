import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_new_api_test/core/app_tracing_logger.dart';
import 'package:google_new_api_test/core/components/app_toast.dart';
import 'package:google_new_api_test/core/connection_checker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  bool get stringify => true;
}

class AppExceptions {
  final String message;
  const AppExceptions(this.message);
}

typedef DispatcherResult = ({dynamic result, Object? error});

extension DispatcherResultUtils on DispatcherResult {
  bool get isSuccess => error == null;

  bool get isError => error != null;
}

typedef AutoDisposeAppStateNotifierProviderFamily<STORE extends AppStateNotifier<AppEvent, STATE>, STATE, ARG>
    = AutoDisposeStateNotifierProviderFamily<STORE, STATE, ARG>;

typedef AutoDisposeAppStateNotifierProvider<STORE extends AppStateNotifier<AppEvent, STATE>, STATE>
    = AutoDisposeStateNotifierProvider<STORE, STATE>;

typedef AppStateNotifierProvider<STORE extends AppStateNotifier<AppEvent, STATE>, STATE> = StateNotifierProvider<STORE, STATE>;

abstract class AppHookConsumerWidget<STORE extends AppStateNotifier<AppEvent, STATE>, STATE> extends HookConsumerWidget {
  const AppHookConsumerWidget({super.key});

  AutoDisposeAppStateNotifierProvider<STORE, STATE> get stateNotifierProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(stateNotifierProvider.notifier);
    final state = ref.watch<STATE>(stateNotifierProvider);

    Future<DispatcherResult> dispatch(AppEvent intent, {void Function(Object e, StackTrace s)? onCustomError}) async {
      try {
        final result = await store.dispatch(intent);
        return (result: result, error: null);
      } catch (e, s) {
        if (e is _AppStateNotifierSilentError) {
          // FirebaseCrashlytics.instance.log('_FwStateNotifierSilentError ${intent.toString()}');
          return (result: null, error: e);
        }

        if (await ConnectionStatusSingleton.getInstance().checkConnection() == false) {
          AppToast.general(message: 'No internet connection. Please try again.').show(context);
          return (result: null, error: e);
        }

        if (e is AppExceptions) {
          AppToast.negative(message: e.message).show(context);
          return (result: null, error: e);
        }

        if (e is HttpException) {
          // FirebaseCrashlytics.instance.log('Failed on $intent');
          // FirebaseCrashlytics.instance.recordError(e, s);
          AppToast.negative(message: e.message).show(context);
          return (result: null, error: e);
        }

        if (onCustomError != null) {
          onCustomError.call(e, s);
          return (result: null, error: e);
        }

        if (e is UnimplementedError) {
          // FirebaseCrashlytics.instance.log('Failed on $intent');
          // FirebaseCrashlytics.instance.recordError(e, s);
          AppToast.negative(message: e.toString()).show(context);
          return (result: null, error: e);
        }

        // FirebaseCrashlytics.instance.recordError(e, s);
        AppToast.negative(message: 'There is unexpected error. Please try again.').show(context);
        return (result: null, error: e);
      }
    }

    return buildWidget(
      context,
      ref,
      state,
      (AppEvent intent, {void Function(Object e, StackTrace s)? onCustomError}) => dispatch(
        intent,
        onCustomError: onCustomError,
      ),
    );
  }

  Widget buildWidget(
    BuildContext context,
    WidgetRef ref,
    STATE state,
    StoreDispatch dispatch,
  );
}

typedef StoreDispatch = Future<DispatcherResult> Function(
  AppEvent event, {
  void Function(Object e, StackTrace s)? onCustomError,
});

abstract class AppStateNotifier<INTENT extends AppEvent, STATE> extends StateNotifier<STATE> {
  AppStateNotifier(super.state)  {
    AppTracingLogger.instance.pushNotifier("Created : ${runtimeType.toString()}");
  }

  void _assertUnMounted() {
    if (!mounted) throw _AppStateNotifierSilentError('Tried to use $runtimeType after it is disposed');
  }

  @override
  set state(STATE state) {
    _assertUnMounted();
    AppTracingLogger.instance.pushNotifier("CurrentState : ${state.toString()}");
    super.state = state;
  }

  @override
  STATE get state {
    _assertUnMounted();
    return super.state;
  }

  @mustCallSuper
  @override
  void dispose() {
    AppTracingLogger.instance.pushNotifier("Disposed : ${runtimeType.toString()}");
    super.dispose();
  }

  @protected
  AppStateNotifierResult mapIntentToState(INTENT intent);

  AppStateNotifierResult dispatch(INTENT intent) async {
    AppTracingLogger.instance.pushNotifier("Dispatched : ${intent.toString()}");
    return await mapIntentToState(intent);
  }
}

typedef AppStateNotifierResult = FutureOr<dynamic>;

class _AppStateNotifierSilentError extends StateError {
  _AppStateNotifierSilentError(super.message);
}

