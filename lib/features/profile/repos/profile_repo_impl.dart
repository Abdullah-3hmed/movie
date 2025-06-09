import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/features/profile/data/profile_model.dart';
import 'package:movie/features/profile/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  ProfileRepoImpl({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final response = await dioHelper.get(
        url: ApiConstants.accountIdEndpoint,
        queryParameters: {"session_id": AppConstants.sessionId},
      );
      if (response.statusCode == 200) {
        return Right(ProfileModel.fromJson(response.data));
      } else {
        throw ServerException(errorModel: ErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessages));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
