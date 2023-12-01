import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:footy_shorts/utils/globals.dart';
import 'package:footy_shorts/utils/methods.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadUserLocalSettings();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: userLocalSettings!.get('theme') == 'dark' ? AdaptiveThemeMode.dark : AdaptiveThemeMode.light,
      dark: ,
      light: ,
      builder: (ThemeData light, ThemeData dark) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
