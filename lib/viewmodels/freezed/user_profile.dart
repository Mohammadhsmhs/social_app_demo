import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:json_serializable/builder.dart';
// part 'userprofile.freezed.dart';
part 'user_profile.freezed.dart';
// part 'user_profile.g.dart';

// @jsonSerializable()
@freezed
abstract class Friends with _$Friends {
  const factory Friends({
    required int id,
    required String guid,
    required String name,
  }) = _Friends;
  // factory Friends.fromJson(Map<String, dynamic> json) =>
  //     _$FriendsFromJson(json);
}

// @jsonSerializable()
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String guid,
    required bool isOwner,
    required String balance,
    required String? picture,
    required int age,
    required String eyeColor,
    required String name,
    required String gender,
    required String company,
    required String email,
    required String phone,
    required String address,
    required String about,
    required String registered,
    required double latitude,
    required double longitude,
    required List<String> tags,
    required List<Friends> friends,
    required String greetings,
    required String favoriteFruit,
  }) = _UserProfile;
  // factory UserProfile.fromJson(Map<String, dynamic> json) =>
  //     _$UserProfileFromJson(json);
}
