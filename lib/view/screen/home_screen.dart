import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie_popular/movie_popular.dart';
import 'package:flutter_movies/network/api.dart';
import 'package:flutter_movies/utils/preference_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List image;
  MoviePopular? moviePopular;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }

  getImage() async {
    await ApiClient(Dio()).getListMovieFopular().then((value) {
      image = value.results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: FutureBuilder(
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
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Image.network(
                                'https://image.tmdb.org/t/p/original${e.backdrop_path ?? ''}'));
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(height: 300));
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
