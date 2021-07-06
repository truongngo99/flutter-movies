import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie_popular/movie_popular.dart';
import 'package:flutter_movies/models/movie_trending/movie_trending_model.dart';

class HeaderSlider extends StatelessWidget {
  final MovieTrendingModel movieTrendingModel;
  const HeaderSlider({Key? key, required this.movieTrendingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: movieTrendingModel.results.map((e) {
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
