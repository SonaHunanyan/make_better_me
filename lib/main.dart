import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/preferenc/shared_prefs.dart';
import 'presentation/page/home/home_page.dart';
import 'presentation/themes/light_theme.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await _init();

  runApp(const MyApp());
}

Future<void> main() async {
  await run();
}

Future<void> _init() async {
  await _registerSingleton();
}

Future<void> _registerSingleton() async {
  await SharedPrefs().init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: lightTheme,
      home: const HomePage(),
    );
  }
}
