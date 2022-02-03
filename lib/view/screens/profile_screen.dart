import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_demo/viewmodels/controllers/profile_controller.dart';

import '../../viewmodels/freezed/user_profile.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/oval_button.dart';
import '../widgets/title_custom.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.userProfile}) : super(key: key);
  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    ProfileController _profileController = Get.find();
    final _width = Get.width;
    final _height = Get.height;
    final _ratio = _height / _width;
    return Scaffold(
      appBar: MyAppBar(userProfile: userProfile),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            // color: Colors.pinkAccent,

            decoration: BoxDecoration(
                color: Colors.deepPurple[200],
                border: Border.all(color: Colors.deepPurpleAccent),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  ratio: _ratio,
                  title: "Balance",
                  titleValue: userProfile.balance,
                  width: _width * .4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      ratio: _ratio,
                      title: "age",
                      titleValue: userProfile.age.toString(),
                      width: _width * .2,
                    ),
                    CustomText(
                      ratio: _ratio,
                      title: "registered",
                      titleValue: userProfile.registered.length > 15
                          ? userProfile.registered.substring(0, 15)
                          : userProfile.registered,
                      width: _width * .55,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      ratio: _ratio,
                      title: "about",
                      titleValue: userProfile.about,
                      width: userProfile.isOwner ? _width * .5 : _width * .8,
                    ),
                    if (userProfile.isOwner)
                      OvalButton(
                        title: 'edit',
                        ratio: _ratio,
                        size: 2,
                        color: Colors.green,
                        func: () {},
                      )
                  ],
                ),
              ],
            ),
          ),
          if (userProfile.friends.isNotEmpty)
            TitleCustom(ratio: _ratio, title: "Friends"),
          if (userProfile.friends.isNotEmpty)
            Container(
              height: Get.height * .09,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: _width * .05,
                ),
                itemBuilder: (context, index) => OvalButton(
                    size: 1,
                    title: userProfile.friends[index].name,
                    ratio: _ratio,
                    color: Colors.blue,
                    func: () async {
                      var tempUser = await _profileController
                          .findUser(userProfile.friends[index].guid);
                      if (tempUser.name == '-1') {
                        Get.snackbar('Error', 'User not found',
                            snackPosition: SnackPosition.BOTTOM);
                      } else {
                        Get.back();
                        Get.to(ProfileScreen(userProfile: tempUser));
                      }
                    }),
                itemCount: userProfile.friends.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          TitleCustom(ratio: _ratio, title: "Greeting"),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.blueAccent[200],
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                userProfile.greetings,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _ratio * 10,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required double ratio,
    required this.title,
    required this.titleValue,
    required this.width,
    this.size = 8,
  })  : _ratio = ratio,
        super(key: key);

  final double _ratio;
  final String title;
  final String titleValue;
  final int size;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        height: _ratio * 20,
        child: Text(
          title + ":  " + titleValue,
          style: TextStyle(fontSize: _ratio * size),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
