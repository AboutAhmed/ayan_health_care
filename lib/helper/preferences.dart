import 'package:ayan_healthcare/debug.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends GetxService {
  late SharedPreferences _preferences;

  Future<Preferences> init() async {
    try {
      _preferences = await SharedPreferences.getInstance();
    } catch (e) {
      Debug.log(e);
    }
    return this;
  }

  Future<void> setString(String key, String? value) async {
    if (value == null) {
      return;
    }
    try {
      await _preferences.setString(key, value);
    } catch (e) {
      Debug.log(e);
    }
  }

  Future<void> setInt(String key, int? value) async {
    if (value == null) {
      return;
    }
    try {
      await _preferences.setInt(key, value);
    } catch (e) {
      Debug.log(e);
    }
  }

  Future<void> setBool(String key, bool? value) async {
    if (value == null) {
      return;
    }

    try {
      await _preferences.setBool(key, value);
    } catch (e) {
      Debug.log(e);
    }
  }

  String? getString(String key) {
    try {
      return _preferences.getString(key);
    } catch (e) {
      Debug.log(e);
    }
    return null;
  }

  int? getInt(String key) {
    try {
      return _preferences.getInt(key);
    } catch (e) {
      Debug.log(e);
    }
    return null;
  }

  bool? getBool(String key) {
    try {
      return _preferences.getBool(key);
    } catch (e) {
      Debug.log(e);
    }
    return null;
  }

  Future<bool> clear() async {
    try {
      return await _preferences.clear();
    } catch (e) {
      Debug.log(e);
    }
    return false;
  }

  // clearRoomPreferences() async {
  //   _preferences.remove(Keys.isWaitingRoom);
  //   _preferences.remove(Keys.rParticipantID);
  //   _preferences.remove(Keys.rDrUserName);
  //   _preferences.remove(Keys.rDrLocation);
  //   _preferences.remove(Keys.roomUrl);
  // }
}
