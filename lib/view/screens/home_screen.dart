import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_demo/view/widgets/user_card.dart';

import '../../viewmodels/controllers/profile_controller.dart';
import '../widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = Get.width;
    final _height = Get.height;
    ProfileController _profileController = Get.find();
    return Scaffold(
      appBar: MyAppBar(userProfile: _profileController.userProfile),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return UserCard(
              userProfile: _profileController.loadedUsers[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
              // height: 10,
              ),
          itemCount: _profileController.loadedUsers.length),
    );
  }
}
