import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie_popular/movie_popular.dart';
import 'package:flutter_movies/models/movie_trending/movie_trending_model.dart';
import 'package:flutter_movies/view/screen/detail_screen.dart';

class TopRateMovieWidget extends StatelessWidget {
  final MovieTrendingModel? listResult;
  TopRateMovieWidget({
    this.listResult,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listResult!.results.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailScreen(
                              urlBackdrop:
                                  listResult!.results[index].backdrop_path,
                              urlPoster: listResult!.results[index].poster_path,
                              title: listResult!.results[index].title,
                              releaseDate:
                                  listResult!.results[index].release_date,
                              voteAverage:
                                  listResult!.results[index].vote_average,
                              voteCount: listResult!.results[index].vote_count,
                            )));
              },
              child: Card(
                  child: Container(
                width: 150,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original${listResult!.results[index].poster_path}',
                        fit: BoxFit.fitWidth,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${listResult!.results[index].title}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              )),
            );
          }),
    );
  }
}
