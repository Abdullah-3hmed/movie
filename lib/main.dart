import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:movie/app_set_up.dart';
import 'package:movie/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSetUp.setUp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(InternetStateManagerInitializer(child: const MyApp())));
}
