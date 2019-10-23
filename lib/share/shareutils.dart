import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class ShareUtils {
  static ShareUtils _instance;
  SharedPreferences shareSave;

  factory ShareUtils() => _instance ?? new ShareUtils._();

  ShareUtils._();

  void instance() async {
    shareSave = await SharedPreferences.getInstance();
  }

  Future<bool> set(key, value) async {
    return shareSave.setString(key, value);
  }

  Future<String> get(key) async {
    return shareSave.getString(key);
  }

}