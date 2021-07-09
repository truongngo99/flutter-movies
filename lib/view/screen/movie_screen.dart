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
import 'package:flutter_movies/bloc/top_rate/top_rate_bloc.dart';
import 'package:flutter_movies/bloc/top_rate/top_rate_event.dart';
import 'package:flutter_movies/bloc/top_rate/top_rate_state.dart';
import 'package:flutter_movies/bloc/upcoming/upcoming_bloc.dart';
import 'package:flutter_movies/bloc/upcoming/upcoming_event.dart';
import 'package:flutter_movies/bloc/upcoming/upcoming_state.dart';

import 'package:flutter_movies/models/movie_popular/movie_popular.dart';

import 'package:flutter_movies/view/widget/header_slider.dart';
import 'package:flutter_movies/view/widget/now_playing.dart';

import 'package:flutter_movies/view/widget/popular.dart';
import 'package:flutter_movies/view/widget/top_rate.dart';
import 'package:flutter_movies/view/widget/upcoming_move_list.dart';

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

    BlocProvider.of<PopularBloc>(context).add(PopularEventStart());
    BlocProvider.of<NowPlayingBloc>(context).add(NowPlayingEventStart());
    BlocProvider.of<MovieTrendingBloc>(context).add(MovieTrendingEventStart());
    BlocProvider.of<MovieTopRateBloc>(context).add(MovieTopRateEventStart());
    BlocProvider.of<MovieUpcomingBloc>(context).add(MovieUpcomingEventStart());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1C262f),
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
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                    textAlign: TextAlign.start,
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
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                    textAlign: TextAlign.start,
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
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                    textAlign: TextAlign.start,
                  ),
                ),
                BlocBuilder<MovieTopRateBloc, MovieTopRateState>(
                    builder: (context, MovieTopRateState state) {
                  if (state is MovieTopRateSuccess) {
                    return TopRateMovieWidget(
                      listResult: state.movieTopRate,
                    );
                  }
                  return CircularProgressIndicator();
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Upcoming movie list',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                    textAlign: TextAlign.start,
                  ),
                ),
                BlocBuilder<MovieUpcomingBloc, MovieUpcomingState>(
                    builder: (context, MovieUpcomingState state) {
                  if (state is MovieUpcomingStateSuccess) {
                    return MovieUpcomingWidget(
                      listResult: state.movieUpcoming,
                    );
                  }
                  return CircularProgressIndicator();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
