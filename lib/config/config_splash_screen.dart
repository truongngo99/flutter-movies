import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/utils/preference_util.dart';
import 'package:flutter_movies/view/screen/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfigSplash {
  // Future<bool> checkToken() async {
  //   await ApiClient(Dio()).getRequestToken().then((value) async {
  //     if (value.success) {
  //       await PreferenceUtils.setString('requestToken', value.request_token);
  //     }
  //   });
  //   return true;
  // }

  checkToken(BuildContext context) async {
    try {
      await ApiClient(Dio()).getRequestToken().then((value) async {
        if (value.success) {
          await PreferenceUtils.setString('requestToken', value.request_token);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed!');
    }
  }
}
