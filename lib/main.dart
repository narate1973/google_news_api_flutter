import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_new_api_test/core/components/app_toast.dart';
import 'package:google_new_api_test/core/connection_checker.dart';
import 'package:google_new_api_test/main_page.dart';
import 'package:google_new_api_test/core/app_shared_preference.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeValueNotifierProvider);
    final seedColor = ref.watch(seedColorValueNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: themeMode.value,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: seedColor.value,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: seedColor.value,
        ),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return AppToast.scope(
          child: HookConsumer(builder: (context, ref, consumerChild) {
            final appSharedPreference = ref.watch(appSharedPreferenceProvider);
            final isReady = useState(false);
          
            useEffect(() {
              () async {
                await appSharedPreference.reload();
                isReady.value = true;
              }();
              return null;
            }, []);
          
            if (!isReady.value) {
              return const Center(child: CircularProgressIndicator());
            }
          
            return child!;
          }),
        );
      },
      home: const MainPage(),
    );
  }
}

final themeValueNotifierProvider = ChangeNotifierProvider.autoDispose<ValueNotifier<ThemeMode>>((ref) {
  return ValueNotifier(ThemeMode.system);
});

final seedColorValueNotifierProvider = ChangeNotifierProvider.autoDispose<ValueNotifier<Color>>((ref) {
  return ValueNotifier(Colors.deepOrange);
});
