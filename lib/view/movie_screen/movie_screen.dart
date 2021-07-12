import 'package:flutter/material.dart';
import 'package:flutter_movies/view/movie_screen/movie_screen_bloc.dart';
import 'package:flutter_movies/view/movie_screen/movie_screen_event.dart';
import 'package:flutter_movies/view/movie_screen/movie_screen_state.dart';
import 'package:flutter_movies/view/widget/header_slider.dart';
import 'package:flutter_movies/view/widget/now_playing.dart';
import 'package:flutter_movies/view/widget/popular.dart';
import 'package:flutter_movies/view/widget/top_rate.dart';
import 'package:flutter_movies/view/widget/upcoming_move_list.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends BaseBlocState<MovieScreen> {
  @override
  Widget build(BuildContext context) =>
      BaseBlocBuilder<MovieScreenState>(bloc as MovieScreenBloc, _buildBody);

  @override
  BaseBloc createBloc() => MovieScreenBloc()..add(MovieScreenEvent());

  Widget _buildBody(BuildContext context, MovieScreenState state) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1C262f),
        body: state.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderSlider(
                          movieTrendingModel: state.movieModelNowPlaying),
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
                      PopularWidget(
                        listMoviePopular: state.movieModelPopular,
                      ),
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
                      NowPlayingWidget(listResult: state.movieModelNowPlaying),
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
                      TopRateMovieWidget(
                        listResult: state.movieModelTopRate,
                      ),
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
                      MovieUpcomingWidget(
                        listResult: state.movieModelUpComming,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
