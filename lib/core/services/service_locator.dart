import 'package:get_it/get_it.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/local/cache_helper.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/features/auth/cubit/auth_cubit.dart';
import 'package:movie/features/auth/repo/auth_repo.dart';
import 'package:movie/features/auth/repo/auth_repo_impl.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    getIt.registerSingleton<AppRouter>(AppRouter());
    getIt.registerLazySingleton<DioHelper>(() => DioHelper());
    getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(dioHelper: getIt<DioHelper>()),
    );
    getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
    getIt.registerFactory<AuthCubit>(
      () => AuthCubit(
        authRepoImpl: getIt<AuthRepo>(),
        cacheHelper: getIt<CacheHelper>(),
      ),
    );
  }
}
