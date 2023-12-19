import 'package:either_dart/either.dart';
import 'package:market_app/core/failures.dart';
import 'package:market_app/modules/authantication/data/models/sign_in_model.dart';

abstract class AuthanticationRepo {
  Future<Either<Failure, SignInModel>> signIn({
    required String email,
    required String password,
  });
}
