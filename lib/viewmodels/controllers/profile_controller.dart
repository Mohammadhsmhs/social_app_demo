import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:social_app_demo/core/errors/failure.dart';
import 'package:social_app_demo/models/services/load_users.dart';
import 'package:social_app_demo/viewmodels/freezed/user_profile.dart';

class ProfileController extends GetxController {
  late final UserProfile userProfile;
  late List<UserProfile> loadedUsers;

  void setUser(UserProfile user) {
    userProfile = user;
  }

  Future<void> getUsers() async {
    var result = await loadUsers();
    if (result is Right) {
      result.fold((l) {}, (r) {
        loadedUsers = r;
      });
    }
  }

  Future<UserProfile> findUser(String uuid) async {
    var result = await findUserById(uuid);
    var notFoundUser = UserProfile(
        guid: uuid,
        isOwner: false,
        balance: '',
        picture: '',
        age: 0,
        eyeColor: '',
        name: '-1',
        gender: '',
        company: '',
        email: '',
        phone: '',
        address: '',
        about: '',
        registered: '',
        latitude: 0,
        longitude: 0,
        tags: [],
        friends: [],
        greetings: '',
        favoriteFruit: '');

    if (result is Right) {
      result.fold((l) {
        return notFoundUser;
      }, (r) {
        UserProfile user = r;
        return user;
      });
    } else {
      return notFoundUser;
    }
    return notFoundUser;
  }
}
