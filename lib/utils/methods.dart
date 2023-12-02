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
  try {} catch (e) {}
}
