import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/local/cache_helper.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/features/auth/cubit/auth_state.dart';
import 'package:movie/features/auth/repo/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.cacheHelper, required this.authRepoImpl})
    : super(const AuthState());
  final AuthRepo authRepoImpl;
  final CacheHelper cacheHelper;

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    emit(state.copyWith(loginStatus: RequestStatus.loading));
    final result = await authRepoImpl.login(
      userName: userName,
      password: password,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            loginStatus: RequestStatus.error,
            loginErrorMessage: failure.errorMessage,
          ),
        );
      },
      (sessionId) async {
        AppConstants.sessionId = sessionId;
        await cacheHelper.saveData(
          key: AppConstants.sessionIdKey,
          value: sessionId,
        );
        emit(state.copyWith(loginStatus: RequestStatus.success));
      },
    );
  }
}
