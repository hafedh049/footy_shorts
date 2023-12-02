import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footy_shorts/home.dart';
import 'package:footy_shorts/utils/globals.dart';
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
        future: Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyBW-rnLPP0cHENo9WRbmwZZNzGP3f1KwkA",
            appId: appId,
            messagingSenderId: messagingSenderId,
            projectId: "footy-shorts",
          ),
        ),
        builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: LottieBuilder.asset("assets/lotties/load.json", width: 80, height: 80)));
          } else {
            return Scaffold(body: Center(child: Text(snapshot.error.toString(), style: const TextStyle(color: teal, fontSize: 16, fontWeight: FontWeight.w500))));
          }
        },
      ),
    );
  }
}
