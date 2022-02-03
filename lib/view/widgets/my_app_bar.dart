import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_demo/models/dummydata/dummyuser.dart';
import 'package:social_app_demo/viewmodels/freezed/user_profile.dart';

import '../../viewmodels/controllers/profile_controller.dart';
import '../screens/profile_screen.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.userProfile,
  }) : super(key: key);
  final UserProfile userProfile;
  // final ProfileController _profileController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          onTap: () {
            Get.to(ProfileScreen(
              userProfile: userProfile,
            ));
          },
          child: userProfile.picture != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(userProfile.picture!),
                )
              : const CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
        ),
      ),
      title: Text(userProfile.name),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
