import 'dart:convert';
import 'package:autologin/screens/home_screen.dart';
import 'package:autologin/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static login(Map userData) async {
    print(userData);

    var response = {"user_id": "99", "user_token": "xx8894jjdsdhsuur"};
    var any = await SharedPreferences.getInstance();

    any.setString("userData", json.encode(response));
    Get.off(HomeScreen());
  }

  Future<bool> tryAutoLogin() async {
    var any = await SharedPreferences.getInstance();
    if (!any.containsKey("userData")) {
      return false;
    } else {
      return true;
    }
  }

  static logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.off(() => LoginScreen());
  }
}
