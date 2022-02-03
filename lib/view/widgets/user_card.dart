import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_demo/models/dummydata/dummyuser.dart';
import 'package:social_app_demo/view/screens/profile_screen.dart';
import 'package:social_app_demo/viewmodels/freezed/user_profile.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.userProfile}) : super(key: key);
  final UserProfile userProfile;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProfileScreen(
          userProfile: userProfile,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ListTile(
              leading: userProfile.picture != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(userProfile.picture!),
                    )
                  : const CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
              title: Text(userProfile.name),
              subtitle: Text(userProfile.email),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text("Address: " + userProfile.address),
            )
          ]),
        ),
      ),
    );
  }
}
