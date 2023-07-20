import 'package:autologin/controller/auth_controller.dart';
import 'package:autologin/screens/home_screen.dart';
import 'package:autologin/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: authController.tryAutoLogin(),
          builder: (contect, authResult) {
            if (authResult.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
              );
            } else {
              if (authResult.data == true) {
                return HomeScreen();
              }
              return LoginScreen();
            }
          }),
    );
  }
}
