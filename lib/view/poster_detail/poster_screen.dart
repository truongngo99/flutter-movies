import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/data/post/api.dart';
import 'package:flutter_movies/view/poster_detail/poster_bloc.dart';
import 'package:flutter_movies/view/poster_detail/poster_event.dart';
import 'package:flutter_movies/view/poster_detail/poster_sate.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class PosterScreen extends StatefulWidget {
  final String id;
  final String title;
  PosterScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _PosterScreenState createState() => _PosterScreenState();
}

class _PosterScreenState extends BaseBlocState<PosterScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => bloc as GetPosterBloc)],
        child: BaseBlocBuilder<GetPosterStateSucess>(
            bloc as GetPosterBloc, _buildBody));
  }

  @override
  BaseBloc createBloc() => GetPosterBloc(context.read<Api>())
    ..add(GetPosterEventStart(movieId: widget.id));

  Widget _buildBody(BuildContext context, GetPosterStateSucess state) {
    int _current = 0;
    CarouselController carouselController = CarouselController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Center(
                  child: CarouselSlider(
                    carouselController: carouselController,
                    items: state.imageModel!.posters!.map((e) {
                      return Container(
                          width: MediaQuery.of(context).size.width,

                          //margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.network(
                              'https://image.tmdb.org/t/p/original${e.file_path ?? ''}'));
                    }).toList(),
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 1.0,
                        height: 500,
                        enlargeCenterPage: true,
                        onPageChanged: (index, other) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    //carouselController: ,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     Flexible(
                //       child: ElevatedButton(
                //         onPressed: () => carouselController.previousPage(),
                //         child: Text('←'),
                //       ),
                //     ),
                //     Flexible(
                //       child: ElevatedButton(
                //         onPressed: () => carouselController.nextPage(),
                //         child: Text('→'),
                //       ),
                //     ),
                //     // ...Iterable<int>.generate(imgList.length).map(
                //     //   (int pageIndex) => Flexible(
                //     //     child: ElevatedButton(
                //     //       onPressed: () => _controller.animateToPage(pageIndex),
                //     //       child: Text("$pageIndex"),
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // )
                // Row(
                //   children: [
                //     ...Iterable<int>.generate(state.imageModel!.posters!.length)
                //         .map(
                //       (int pageIndex) => InkWell(
                //         onTap: () =>
                //             carouselController.animateToPage(pageIndex),
                //         child: Image.network(
                //           'https://image.tmdb.org/t/p/original${state.imageModel!.posters![pageIndex].file_path}',
                //           height: 100,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.imageModel!.posters!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              carouselController.animateToPage(index);
                            },
                            child: Image.network(
                                'https://image.tmdb.org/t/p/original${state.imageModel!.posters![index].file_path}'),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
