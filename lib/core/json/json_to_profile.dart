import '../../viewmodels/freezed/user_profile.dart';

UserProfile jsonToProfile(Map<String, dynamic> json) {
  final _friends = json['friends'];
  final _tags = json['tags'];
  List<Friends> friends = [];
  for (var friend in _friends) {
    friends.add(Friends(
      id: friend['id'],
      guid: friend['guid'],
      name: friend['name'],
    ));
  }
  return UserProfile(
      guid: json['guid'],
      isOwner: json['isOwner'],
      balance: json['balance'],
      picture: json['picture'],
      age: json['age'],
      eyeColor: json['eyeColor'],
      name: json['name'],
      gender: json['gender'],
      company: json['company'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      about: json['about'],
      registered: json['registered'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      tags: json['tags'],
      friends: friends,
      greetings: json['greeting'],
      favoriteFruit: json['favoriteFruit']);
}
