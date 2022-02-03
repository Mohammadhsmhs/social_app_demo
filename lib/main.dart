import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:social_app_demo/viewmodels/controllers/auth_controller.dart';
import 'package:social_app_demo/viewmodels/controllers/profile_controller.dart';

import 'view/screens/auth_screen.dart';

void main() {
  Get.lazyPut(() => ProfileController());
  Get.lazyPut(() => AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
    );
  }
}
