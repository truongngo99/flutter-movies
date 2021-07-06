import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/movie_trending/movie_trending_bloc.dart';
import 'package:flutter_movies/bloc/movie_trending/movie_trending_event.dart';
import 'package:flutter_movies/bloc/movie_trending/movie_trending_state.dart';
import 'package:flutter_movies/bloc/now_playing/now_playing_bloc.dart';
import 'package:flutter_movies/bloc/now_playing/now_playing_event.dart';
import 'package:flutter_movies/bloc/now_playing/now_playing_state.dart';
import 'package:flutter_movies/bloc/popular/popular_bloc.dart';
import 'package:flutter_movies/bloc/popular/popular_event.dart';
import 'package:flutter_movies/bloc/popular/popular_state.dart';
import 'package:flutter_movies/models/movie_now_playing/movie_now_playing.dart';
import 'package:flutter_movies/models/movie_popular/movie_popular.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/view/widget/header_slider.dart';
import 'package:flutter_movies/view/widget/now_playing.dart';

import 'package:flutter_movies/view/widget/popular.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late List image;
  MoviePopular? moviePopular;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
    BlocProvider.of<PopularBloc>(context).add(PopularEventStart());
    BlocProvider.of<NowPlayingBloc>(context).add(NowPlayingEventStart());
    BlocProvider.of<MovieTrendingBloc>(context).add(MovieTrendingEventStart());
  }

  getImage() async {
    await ApiClient(Dio()).getListMovieFopular().then((value) {
      image = value.results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<MovieTrendingBloc, MovieTrendingState>(
                  builder: (context, MovieTrendingState state) {
                if (state is MovieTrendingSuccess) {
                  return HeaderSlider(
                    movieTrendingModel: state.movieTreding,
                  );
                }
                return CircularProgressIndicator();
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Popular',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
              BlocBuilder<PopularBloc, PopularState>(
                  builder: (context, PopularState state) {
                if (state is PopularSuccess) {
                  return PopularWidget(
                    listResult: state.moviePopular,
                  );
                }
                return CircularProgressIndicator();
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Now Playing',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
              BlocBuilder<NowPlayingBloc, NowPlayingState>(
                  builder: (context, NowPlayingState state) {
                if (state is NowPlayingSuccess) {
                  return NowPlayingWidget(
                    listResult: state.movieNowPlaying,
                  );
                }
                return CircularProgressIndicator();
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Top Rate',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
              //PopularWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Upcoming movie list',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
              //PopularWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
