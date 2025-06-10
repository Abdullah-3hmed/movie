import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie/bloc_observer.dart';
import 'package:movie/core/local/cache_helper.dart';
import 'package:movie/core/network/dio_helper.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.init();
  await dotenv.load(fileName: "lib/.env");
  DioHelper.init();
  AppConstants.sessionId =
      await getIt<CacheHelper>().readData(key: AppConstants.sessionIdKey) ?? "";

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
