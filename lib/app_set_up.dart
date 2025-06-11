import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie/bloc_observer.dart';
import 'package:movie/core/local/cache_helper.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/core/util/app_constants.dart';

class AppSetUp {
  static Future<void> setUp() async {
    ServiceLocator.init();
    await getIt<CacheHelper>().isFirstInstall();
    await dotenv.load(fileName: "lib/.env");
    DioHelper.init();
    AppConstants.sessionId =
        await getIt<CacheHelper>().readData(key: AppConstants.sessionIdKey) ??
        "";

    Bloc.observer = MyBlocObserver();
  }
}
