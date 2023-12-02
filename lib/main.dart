import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footy_shorts/home.dart';
import 'package:footy_shorts/utils/methods.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadUserLocalSettings();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<FirebaseApp>(
        future: null,
        builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: LottieBuilder.asset("assets/lotties/load.json", width: 80, height: 80)));
          } else {
            Scaffold(body: Center(child: LottieBuilder.asset("assets/lotties/load.json", width: 80, height: 80)));
          }
        },
      ),
    );
  }
}
