import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/utils/preference_util.dart';
import 'package:flutter_movies/view/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  _checkToken() async {
    await ApiClient(Dio()).getRequestToken().then((value) async {
      if (value.success) {
        await PreferenceUtils.setString('requestToken', value.request_token);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
      } else {
        AlertDialog(
          title: Text('Request Faiel'),
          content: Text('Request Fail'),
          actions: [
            FlatButton(
              onPressed: () {},
              child: Text('Ok'),
            )
          ],
        );
      }
    });
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
