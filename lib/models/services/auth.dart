import 'package:dartz/dartz.dart';

import '../../core/errors/Failure.dart';
import '../../core/errors/exceptions.dart';
import '../../core/json/json_to_profile.dart';
import '../../viewmodels/freezed/user_profile.dart';
import '../dummydata/dummyuser.dart';

Future<Either<Failure, UserProfile>> logIn(
    String userName, String password) async {
  var json = user;
  try {
    if (userName == "12345" && password == "54321") {
      return Right(jsonToProfile(json));
    } else {
      return Left(ServerFailure());
    }
  } on ServerExceptions {
    return Left(ServerFailure());
  }
}
