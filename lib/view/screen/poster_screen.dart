import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/get_poster/get_poster_bloc.dart';
import 'package:flutter_movies/bloc/get_poster/get_poster_state.dart';

class PosterScreen extends StatefulWidget {
  final String title;
  PosterScreen({Key? key, required this.title}) : super(key: key);

  @override
  _PosterScreenState createState() => _PosterScreenState();
}

class _PosterScreenState extends State<PosterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Poster ${widget.title}'),
        ),
        body: BlocBuilder<GetPosterBloc, GetPosterState>(
          builder: (context, GetPosterState state) {
            if (state is GetPosterStateSucess) {
              return Center(
                child: CarouselSlider(
                  items: state.imageModel!.posters!.map((e) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,

                            //margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Image.network(
                                'https://image.tmdb.org/t/p/original${e.file_path ?? ''}'));
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.0,
                    height: 500,
                    enlargeCenterPage: true,
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
