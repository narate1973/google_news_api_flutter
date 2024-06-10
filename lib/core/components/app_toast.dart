import 'dart:async';

import 'package:flutter/material.dart';

class AppToast {
  final Color backgroundColor;
  final IconData icon;
  final String message;

  static Widget scope({required Widget child}) {
    return _AppToast(
      child: child,
    );
  }

  const AppToast._({
    required this.backgroundColor,
    required this.icon,
    required this.message,
  });

  AppToast.general({required String message})
      : this._(message: message, backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8), icon: Icons.info_outlined);

  AppToast.positive({required String message})
      : this._(message: message, backgroundColor: const Color.fromRGBO(25, 154, 128, 1), icon: Icons.check_circle);

  AppToast.negative({required String message})
      : this._(message: message, backgroundColor: const Color.fromRGBO(229, 61, 46, 1), icon: Icons.warning_amber);

  show(BuildContext context) {
    _AppToast.show(
      context,
      message: message,
      color: backgroundColor,
      icon: icon,
    );
  }
}

class _AppToast extends StatefulWidget {
  final Widget child;

  const _AppToast({
    required this.child,
  });

  static void show(
    BuildContext context, {
    required String message,
    required Color color,
    required IconData icon,
  }) {
    context.findAncestorStateOfType<_AppToastState>()?.showToast(
          message: message,
          color: color,
          icon: icon,
        );
  }

  @override
  State<_AppToast> createState() => _AppToastState();
}

class _AppToastState extends State<_AppToast> {
  bool isShowToast = false;
  String message = '';
  Color color = Colors.red;
  IconData icon = Icons.error;

  /// for motion detect
  double initialY = 0.0; // Store the initial Y position
  double deltaY = 0.0; // Store the change in Y position

  /// queue control
  Timer? _timer;

  void showToast({required String message, required Color color, required IconData icon}) async {
    this.message = message;
    this.color = color;
    this.icon = icon;

    /// in case toast is requested show when it's showing
    if (_timer?.isActive == true) {
      setState(() {
        _timer?.cancel();
        isShowToast = false;
      });
    }
    _showToast();
  }

  void _showToast() {
    setState(() {
      isShowToast = true;
    });

    _timer = Timer(const Duration(milliseconds: 3000), () {
      if (isShowToast) {
        setState(() {
          isShowToast = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final toastContainer = Container(
      width: MediaQuery.of(context).size.width - (16 + 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              icon,
              color: const Color.fromRGBO(255, 255, 255, 0.95),
              size: 12.0,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
    final activeToastPositionTop = 24 + MediaQuery.of(context).padding.top;
    return Material(
      child: Stack(
        children: [
          widget.child,
          AnimatedPositioned(
            top: isShowToast ? activeToastPositionTop : -100,
            duration: const Duration(milliseconds: 200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onVerticalDragStart: (details) {
                  initialY = details.globalPosition.dy;
                },
                onLongPressStart: (_) {
                  // When long-press starts, set isHoldingToast to true
                  if (_timer?.isActive == true) {
                    _timer?.cancel();
                  }
                },
                onLongPressEnd: (_) {
                  // When long-press ends, set isHoldingToast to false
                  _timer = Timer(const Duration(milliseconds: 500), () {
                    if (isShowToast) {
                      setState(() {
                        isShowToast = false;
                      });
                    }
                  });
                },
                onVerticalDragUpdate: (details) {
                  double currentY = details.globalPosition.dy;
                  deltaY = currentY - initialY;

                  if (deltaY < -5) {
                    setState(() {
                      initialY = 0.0;
                      deltaY = 0.0;
                      isShowToast = false;
                      if (_timer?.isActive == true) _timer?.cancel();
                    });
                  }

                  initialY = currentY;
                },
                onVerticalDragEnd: (details) {
                  initialY = 0.0;
                  deltaY = 0.0;
                },
                child: toastContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
