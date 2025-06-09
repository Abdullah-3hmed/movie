import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> login({
    required String userName,
    required String password,
  });
  Future<Either<Failure, int>> getAccountId({required String sessionId});
  Future<void> signUp();
  Future<void> resetPassword();
}
