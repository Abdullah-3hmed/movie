import 'package:get_it/get_it.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/local/cache_helper.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/features/auth/cubit/auth_cubit.dart';
import 'package:movie/features/auth/repo/auth_repo.dart';
import 'package:movie/features/auth/repo/auth_repo_impl.dart';
import 'package:movie/features/movies/cubit/actor/actor_cubit.dart';
import 'package:movie/features/movies/cubit/movie/movie_cubit.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie/features/movies/cubit/movie_details/movie_details_cubit_manager.dart';
import 'package:movie/features/movies/repos/actor/actor_repo.dart';
import 'package:movie/features/movies/repos/actor/actor_repo_impl.dart';
import 'package:movie/features/movies/repos/movie/movie_repo.dart';
import 'package:movie/features/movies/repos/movie_details/movie_details_repo.dart';
import 'package:movie/features/movies/repos/movie_details/movie_details_repo_impl.dart';
import 'package:movie/features/profile/cubit/profile_cubit.dart';
import 'package:movie/features/profile/repos/profile_repo.dart';
import 'package:movie/features/profile/repos/profile_repo_impl.dart';
import 'package:movie/features/search/bloc/search_bloc.dart';
import 'package:movie/features/search/repos/search_repo.dart';
import 'package:movie/features/search/repos/search_repo_impl.dart';
import 'package:movie/features/tv/cubit/tv_cubit/tv_cubit.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit.dart';
import 'package:movie/features/tv/repos/tv_details_repo/tv_details_repo.dart';
import 'package:movie/features/tv/repos/tv_details_repo/tv_details_repo_impl.dart';
import 'package:movie/features/tv/repos/tv_repo/tv_repo.dart';
import 'package:movie/features/tv/repos/tv_repo/tv_repo_impl.dart';

import '../../features/movies/repos/movie/movie_repo_impl.dart';

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
    getIt.registerLazySingleton<MovieRepo>(
      () => MovieRepoImpl(dioHelper: getIt<DioHelper>()),
    );
    getIt.registerFactory<MovieCubit>(
      () => MovieCubit(movieRepo: getIt<MovieRepo>()),
    );
    getIt.registerLazySingleton<MovieDetailsRepo>(
      () => MovieDetailsRepoImpl(dioHelper: getIt<DioHelper>()),
    );
    getIt.registerFactory<MovieDetailsCubit>(
      () => MovieDetailsCubit(movieDetailsRepo: getIt<MovieDetailsRepo>()),
    );
    getIt.registerLazySingleton<ActorRepo>(
      () => ActorRepoImpl(dioHelper: getIt<DioHelper>()),
    );
    getIt.registerFactory<ActorCubit>(
      () => ActorCubit(actorRepo: getIt<ActorRepo>()),
    );
    getIt.registerLazySingleton<TvRepo>(
      () => TvRepoImpl(dioHelper: getIt<DioHelper>()),
    );
    getIt.registerFactory<TvCubit>(() => TvCubit(tvRepo: getIt<TvRepo>()));

    getIt.registerLazySingleton<TvDetailsRepo>(
      () => TvDetailsRepoImpl(dioHelper: getIt<DioHelper>()),
    );
    getIt.registerFactory<TvDetailsCubit>(
      () => TvDetailsCubit(tvDetailsRepo: getIt<TvDetailsRepo>()),
    );
    getIt.registerLazySingleton<SearchRepo>(
      () => SearchRepoImpl(dioHelper: getIt<DioHelper>()),
    );
    getIt.registerFactory<SearchBloc>(
      () => SearchBloc(searchRepo: getIt<SearchRepo>()),
    );
    getIt.registerLazySingleton<ProfileRepo>(
      () => ProfileRepoImpl(dioHelper: getIt<DioHelper>()),
    );
    getIt.registerFactory<ProfileCubit>(
      () => ProfileCubit(profileRepo: getIt<ProfileRepo>()),
    );
  }
}
