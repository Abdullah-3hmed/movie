import 'package:get_it/get_it.dart';
import 'package:movie/config/router/app_router.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    getIt.registerSingleton<AppRouter>(AppRouter());
  }
}
