import 'package:flutter/material.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/my_app.dart';

void main() {
  ServiceLocator.init();
  runApp(const MyApp());
}
