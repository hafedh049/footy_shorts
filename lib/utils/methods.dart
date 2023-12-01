import 'package:footy_shorts/utils/globals.dart';
import 'package:hive/hive.dart';

Future<bool> loadUserLocalSettings() async {
  try {
    userLocalSettings = await Hive.openBox('name');
    return true;
  } catch (e) {
    return false;
  }
}
