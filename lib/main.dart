import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/get_poster/get_poster_bloc.dart';

import 'package:flutter_movies/bloc/movie_trending/movie_trending_bloc.dart';
import 'package:flutter_movies/bloc/now_playing/now_playing_bloc.dart';
import 'package:flutter_movies/bloc/popular/popular_bloc.dart';
import 'package:flutter_movies/bloc/review_movie/review_movie_bloc.dart';
import 'package:flutter_movies/bloc/top_rate/top_rate_bloc.dart';
import 'package:flutter_movies/bloc/upcoming/upcoming_bloc.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/view/cast_crew/cast_crew_bloc.dart';
import 'package:flutter_movies/view/caster/caster_bloc.dart';

import 'package:flutter_movies/view/home.dart';
import 'package:flutter_movies/view/splash/splash_screen.dart';
import 'package:flutter_movies/view/trailer/trailer_bloc.dart';

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
        BlocProvider<PopularBloc>(create: (context) => PopularBloc()),
        BlocProvider<NowPlayingBloc>(create: (context) => NowPlayingBloc()),
        BlocProvider<MovieTrendingBloc>(
            create: (context) => MovieTrendingBloc()),
        BlocProvider<MovieTopRateBloc>(create: (context) => MovieTopRateBloc()),
        BlocProvider<MovieUpcomingBloc>(
            create: (context) => MovieUpcomingBloc()),
        BlocProvider<GetPosterBloc>(create: (context) => GetPosterBloc()),
        BlocProvider<ReviewMovieBloc>(create: (context) => ReviewMovieBloc()),
        BlocProvider<CastCewBloc>(create: (context) => CastCewBloc()),
        BlocProvider<TrailerBloc>(create: (context) => TrailerBloc()),
      ],
      child: TeqCoreApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        enableConfigView: true,
        home: SplashScreen(),
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
