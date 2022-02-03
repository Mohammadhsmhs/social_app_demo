import 'package:dartz/dartz.dart';
import 'package:social_app_demo/core/errors/exceptions.dart';
import 'package:social_app_demo/core/json/json_to_profile.dart';

import '../../core/errors/failure.dart';
import '../../viewmodels/freezed/user_profile.dart';
import '../dummydata/dummyuser.dart';

Future<Either<Failure, List<UserProfile>>> loadUsers() async {
  var json = users;
  try {
    List<UserProfile> _users = [];
    for (var user in json) {
      _users.add(jsonToProfile(user));
    }
    return Right(_users);
  } on ServerExceptions {
    return Left(ServerFailure());
  }
}

Future<Either<Failure, UserProfile>> findUserById(String uuid) async {
  var json = users;
  try {
    List<UserProfile> _users = [];
    for (var user in json) {
      _users.add(jsonToProfile(user));
    }
    var temp = _users.firstWhere((element) => element.guid == uuid);
    return Right(temp);
  } on Exception {
    return Left(ServerFailure());
  }
}
