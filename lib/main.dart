import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/main_app.dart';
import 'package:todoapp/injection_container/injection_container.dart' as sl;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    sl.initialize(),
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]),
  ]);

  runApp(const MainApp());
}
