import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_demo/view/widgets/text_input_form_custom.dart';
import 'package:social_app_demo/viewmodels/controllers/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);
  final _width = Get.width;
  final _height = Get.height;
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: _height * .1,
          ),
          Center(
            child: Container(
              width: _width * .9,
              height: _height * .3,
              // color: Colors.amber,
              child: Form(
                key: _authController.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: _height * .04,
                    ),
                    TextInputFormCustom(
                      hint: 'User Name',
                      func: _authController.updateUserName,
                    ),
                    SizedBox(
                      height: _height * .02,
                    ),
                    TextInputFormCustom(
                        hint: 'Password', func: _authController.updatePassword),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: _height * .25,
          ),
          Center(
            child: SizedBox(
                width: _width * .85,
                child: ElevatedButton(
                    onPressed: _authController.tryLogIn,
                    child: const Text('LogIn'))),
          ),
        ],
      ),
    );
  }
}
