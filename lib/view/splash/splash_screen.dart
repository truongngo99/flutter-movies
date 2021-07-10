import 'package:flutter/material.dart';
import 'package:flutter_movies/view/login/login_screen.dart';

import 'package:flutter_movies/view/splash/splash_bloc.dart';
import 'package:flutter_movies/view/splash/splash_event.dart';
import 'package:flutter_movies/view/splash/splash_state.dart';

import 'package:teq_flutter_core/teq_flutter_core.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseBlocState<SplashScreen> {
  @override
  Widget build(BuildContext context) => BaseBlocConsumer<SplashStateSuccess>(
        bloc as SplashBoc,
        _buildBody,
        _buildListen,
      );

  @override
  BaseBloc createBloc() => SplashBoc()..add(SplashEvent());
  _buildListen(BuildContext context, SplashStateSuccess state) {
    state.isLoading
        ? true
        : state.requestToken!.success
            ? Future.delayed(Duration(seconds: 3),
                () => transferToNewScreen(context, LoginScreen()))
            : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Get Request Token Failed'),
                duration: Duration(seconds: 1),
              ));
  }

  Widget _buildBody(BuildContext context, SplashStateSuccess state) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: state.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  color: Colors.white,
                ),
              )
            : Center(
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
              ));
  }
}
