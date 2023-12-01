import 'package:footy_shorts/utils/globals.dart';
import 'package:hive/hive.dart';

Future<bool> loadUserLocalSettings() async {
  try {
    Hive.init(path)
    userLocalSettings = await Hive.openBox('userLocalSettings');
    return true;
  } catch (e) {
    return false;
  }
}
