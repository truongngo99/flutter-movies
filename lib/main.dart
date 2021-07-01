import 'package:flutter/material.dart';

import 'package:flutter_movies/view/screen/splash_screen.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentEnvironment = Environment.DEV;
  }

  @override
  Widget build(BuildContext context) {
    return TeqCoreApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      enableConfigView: true,
      home: SplashScreen(),
      width: 200,
      height: 812,
    );
  }
}
