import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/error_model.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/core/error/server_exception.dart';
import 'package:movie/core/local/cache_helper.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/features/auth/repo/auth_repo.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.dioHelper});

  final DioHelper dioHelper;

  Future<String> getRequestToken() async {
    final response = await dioHelper.get(
      url: ApiConstants.requestTokenEndpoint,
    );

    if (!response.data['success']) {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
    return response.data['request_token'];
  }

  Future<void> validateWithLogin({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final response = await dioHelper.post(
      url: ApiConstants.validateLoginEndpoint,
      data: {
        'username': username,
        'password': password,
        'request_token': requestToken,
      },
    );

    if (response.data['success'] != true) {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  Future<String> createSession(String requestToken) async {
    final response = await dioHelper.post(
      url: ApiConstants.createSessionEndpoint,
      data: {'request_token': requestToken},
    );

    if (response.data['success'] != true) {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }

    return response.data['session_id'];
  }

  @override
  Future<Either<Failure, String>> login({
    required String userName,
    required String password,
  }) async {
    try {
      final token = await getRequestToken();
      await validateWithLogin(
        username: userName,
        password: password,
        requestToken: token,
      );
      final String sessionId = await createSession(token);
      return Right(sessionId);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessages));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> signUp() async {
    const String url = "https://www.themoviedb.org/signup";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Future<void> resetPassword() async {
    const String url = "https://www.themoviedb.org/reset-password";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Future<void> logout() async {
    AppConstants.sessionId = "";
    await getIt<CacheHelper>().delete(key: AppConstants.sessionIdKey);
  }
}
