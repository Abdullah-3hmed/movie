import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/app_set_up.dart';
import 'package:movie/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSetUp.setUp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const MyApp()));
}
