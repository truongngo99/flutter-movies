import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/login/login_bloc.dart';
import 'package:flutter_movies/bloc/now_playing/now_playing_bloc.dart';
import 'package:flutter_movies/bloc/popular/popular_bloc.dart';

import 'package:flutter_movies/models/authentication/login_body.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/view/home.dart';
import 'package:flutter_movies/view/screen/movie_screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<PopularBloc>(create: (context) => PopularBloc()),
        BlocProvider<NowPlayingBloc>(create: (context) => NowPlayingBloc()),
      ],
      child: TeqCoreApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        enableConfigView: true,
        home: HomeScreen(),
        width: 200,
        height: 812,
      ),
    );
  }
}
