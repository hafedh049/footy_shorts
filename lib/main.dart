import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footy_shorts/home.dart';
import 'package:footy_shorts/utils/globals.dart';
import 'package:footy_shorts/utils/methods.dart';
import 'package:footy_shorts/views/auth/sign_in.dart';
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
      home: FutureBuilder<bool>(
        future: load(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return FirebaseAuth.instance.currentUser == null ? const SignIn() : const Home();
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
