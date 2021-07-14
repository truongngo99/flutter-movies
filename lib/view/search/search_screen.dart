import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/data/post/api.dart';
import 'package:flutter_movies/data/response/cast_crew/cast.dart';
import 'package:flutter_movies/data/response/movie/movie_model.dart';
import 'package:flutter_movies/data/response/movie/result_movie.dart';
import 'package:flutter_movies/view/search/search_bloc.dart';
import 'package:flutter_movies/view/search/search_event.dart';
import 'package:flutter_movies/view/search/search_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseBlocState<SearchScreen> {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => bloc as SearchBloc),
          ],
          child: BaseBlocConsumer<SearchState>(
              bloc as SearchBloc, _buildBody, _buildListen));

  @override
  BaseBloc createBloc() => SearchBloc(context.read<Api>());
  _buildListen(BuildContext context, SearchState state) {
    if (state.movieModel != null) {}
    return null;
  }

  Widget _buildBody(BuildContext context, SearchState state) {
    TextEditingController _searchController = TextEditingController();
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        hintText: 'Search Films',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              addEvent(
                                  SearchEvent(search: _searchController.text));
                            },
                            icon: Icon(Icons.search))),
                  ),
                  // Container(
                  //   height: 200,
                  //   child: ListView.builder(
                  //       itemCount: 5,
                  //       itemBuilder: (context, index) {
                  //         return Column(
                  //           children: [
                  //             Text(
                  //                 '${state.searchKeyModel?.results![index].name}'),
                  //             Text('${state.movieModel?.results[index].title}'),
                  //           ],
                  //         );
                  //       }),
                  // )
                ],
              ),
            ),
            Container(
              height: 500,
              child: !(!state.isLoading && state.saveModel != null)
                  ? Center(
                      child: !state.isLoading
                          ? Container()
                          : CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: state.saveModel?.results?.length,
                      itemBuilder: (context, index) {
                        String posterDefaul =
                            'https://www.mayacinemas.com/themes/web/images/default-movie.png';
                        String? poster =
                            state.movieModel?.results[index].poster_path;
                        String posterUI =
                            'https://image.tmdb.org/t/p/original$poster';
                        if (state.saveModel!.results![index]
                            is ListMovieResults) {
                          var movieortv = state.saveModel!.results![index]
                              as ListMovieResults;
                          return Container(
                            padding: EdgeInsets.only(bottom: 10),
                            height: 210,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 50,
                                  left: 40,
                                  child: Container(
                                    width: 350,
                                    height: 150,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      shadowColor: Colors.blueGrey,
                                      elevation: 10,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 85,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                155,
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  movieortv.title ?? '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Date: ',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      movieortv.release_date ??
                                                          '',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    RatingBarIndicator(
                                                      rating: movieortv
                                                              .vote_average! /
                                                          2,
                                                      direction:
                                                          Axis.horizontal,
                                                      itemCount: 5,
                                                      itemSize: 14,
                                                      unratedColor: Colors.grey,
                                                      itemPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 1.0),
                                                      itemBuilder:
                                                          (context, _) => Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${movieortv.vote_average}',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '   ${movieortv.overview}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 4,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  child: Container(
                                    width: 100,
                                    height: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      child: Image.network(
                                        poster == null
                                            ? posterDefaul
                                            : posterUI,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        var person = state.saveModel!.results![index] as Cast;
                        return Text(person.name ?? '');
                      },
                    ),
            )
          ],
        ),
      ),
    ));
  }
}
