import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:light_regulator_app/Themes/light_mode.dart';
import 'package:light_regulator_app/firebase_options.dart';
import 'package:light_regulator_app/pages/home_page.dart';
import 'package:light_regulator_app/services/auth/auth_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: HomePage(),
    );
  }
}

