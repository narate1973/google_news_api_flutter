import 'package:flutter/material.dart';

Future showSettingDialog(BuildContext context, {
  required ValueNotifier<ThemeMode> themeNotifier,
  required ValueNotifier<Color> seedColor,
}) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Text('Theme mode preferences', style: Theme.of(context).textTheme.titleMedium),
            RadioMenuButton(
              value: themeNotifier.value,
              groupValue: ThemeMode.light,
              onChanged: (value) {
                if (value != null) themeNotifier.value = ThemeMode.light;
              },
              child: Text('Light Mode', style: Theme.of(context).textTheme.bodyMedium),
            ),
            RadioMenuButton(
              value: themeNotifier.value,
              groupValue: ThemeMode.dark,
              onChanged: (value) {
                if (value != null) themeNotifier.value = ThemeMode.dark;
              },
              child: Text('Dark Mode', style: Theme.of(context).textTheme.bodyMedium),
            ),
            RadioMenuButton(
              value: themeNotifier.value,
              groupValue: ThemeMode.system,
              onChanged: (value) {
                if (value != null) themeNotifier.value = ThemeMode.system;
              },
              child: Text('System Mode', style: Theme.of(context).textTheme.bodyMedium),
            ),
            const Divider(),
            Text('Color seed', style: Theme.of(context).textTheme.titleMedium),
            RadioMenuButton(
              value: seedColor.value,
              groupValue: Colors.deepOrange,
              onChanged: (value) {
                if (value != null) seedColor.value = Colors.deepOrange;
              },
              child: Text('Deep orange', style: Theme.of(context).textTheme.bodyMedium),
            ),
            RadioMenuButton(
              value: seedColor.value,
              groupValue: Colors.lightBlue,
              onChanged: (value) {
                if (value != null) seedColor.value = Colors.lightBlue;
              },
              child: Text('Light blue', style: Theme.of(context).textTheme.bodyMedium),
            ),
            RadioMenuButton(
              value: seedColor.value,
              groupValue: Colors.deepPurple,
              onChanged: (value) {
                if (value != null) seedColor.value = Colors.deepPurple;
              },
              child: Text('Deep purple', style: Theme.of(context).textTheme.bodyMedium),
            ),
            // SwitchListTile(
            //   title: Text('Dark Mode', style: Theme.of(context).textTheme.bodyMedium),
            //   value: Theme.of(context).brightness == Brightness.dark,
            //   onChanged: (value) {
            //     widget.onThemeChanged();
            //   },
            // ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close', style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      );
    },
  );
}