import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      builder: (ThemeData light, ThemeData dark) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
