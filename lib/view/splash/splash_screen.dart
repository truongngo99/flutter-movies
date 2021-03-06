import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/data/post/api.dart';
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
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => bloc as SplashBoc)],
        child: BaseBlocConsumer<SplashStateSuccess>(
          bloc as SplashBoc,
          _buildBody,
          _buildListen,
        ));
  }

  @override
  BaseBloc createBloc() => SplashBoc(context.read<Api>())..add(SplashEvent());
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
    return state.isLoading
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                color: Colors.white,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Color(0xffff9a6f),
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 300,
                    width: 300,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircularProgressIndicator(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    'Teq',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'CopyRight 2021',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ));
  }
}
