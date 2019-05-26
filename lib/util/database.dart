library miru.globals;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();
var test_value = 'hello world1';

Future createDefaults() async {
  var settingPlayerType = await storage.read(key: 'setting_player_type');
  if (settingPlayerType == null) {
    await setSetting('setting_player_type', 'Openload');
  }

  // Other defaults here
}

Future<dynamic> getSetting(String setting) async {
  return await storage.read(key: setting);
}

Future<dynamic> setSetting(String setting, dynamic value) async {
  return await storage.write(key: setting, value: value);
}

Future<String> setSettingPlayerType(String playerType) async {
  return await setSetting('setting_player_type', playerType);
}

Future<String> getSettingPlayerType() async {
  return await getSetting('setting_player_type');
}
