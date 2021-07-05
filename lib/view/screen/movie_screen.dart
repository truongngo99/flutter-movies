import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/now_playing/now_playing_bloc.dart';
import 'package:flutter_movies/bloc/now_playing/now_playing_event.dart';
import 'package:flutter_movies/bloc/now_playing/now_playing_state.dart';
import 'package:flutter_movies/bloc/popular/popular_bloc.dart';
import 'package:flutter_movies/bloc/popular/popular_event.dart';
import 'package:flutter_movies/bloc/popular/popular_state.dart';
import 'package:flutter_movies/models/movie_now_playing/movie_now_playing.dart';
import 'package:flutter_movies/models/movie_popular/movie_popular.dart';
import 'package:flutter_movies/network/api.dart';
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
  MovieNowPlaying? movieNowPlaying;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
    BlocProvider.of<PopularBloc>(context).add(PopularEventStart());
    BlocProvider.of<NowPlayingBloc>(context).add(NowPlayingEventStart());
  }

  getImage() async {
    await ApiClient(Dio()).getListMovieFopular().then((value) {
      image = value.results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: ApiClient(Dio()).getListMovieFopular(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      moviePopular = snapshot.data as MoviePopular?;
                      image = moviePopular!.results;
                      return CarouselSlider(
                        items: image.map((e) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Image.network(
                                      'https://image.tmdb.org/t/p/original${e.backdrop_path ?? ''}'));
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          height: 180,
                          enlargeCenterPage: true,
                        ),
                      );
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
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
