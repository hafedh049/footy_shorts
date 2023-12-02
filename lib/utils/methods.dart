import 'package:firebase_core/firebase_core.dart';
import 'package:footy_shorts/utils/globals.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<bool> loadUserLocalSettings() async {
  try {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    userLocalSettings = await Hive.openBox('userLocalSettings');
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> load() async {
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        storageBucket: "footy-shorts.appspot.com",
        apiKey: "AIzaSyBW-rnLPP0cHENo9WRbmwZZNzGP3f1KwkA",
        appId: "1:731346863322:android:d7391a9de82ddcc03c91e3",
        messagingSenderId: "731346863322",
        projectId: "footy-shorts",
      ),
    );
    await loadUserLocalSettings();
    if (userLocalSettings!.get("first_time") == null) {
      userLocalSettings!.put("first_time", true);
    }
    if (userLocalSettings!.get("theme") == null) {
      userLocalSettings!.put("theme", "dark");
    }
    return true;
  } catch (e) {
    return false;
  }
}
