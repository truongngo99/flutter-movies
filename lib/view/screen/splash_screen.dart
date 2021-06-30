import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movies/view/screen/login_screen.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.red,
            ),
            SizedBox(
              height: 200,
            ),
            Text(
              'Teq',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'CopyRight 2021',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
