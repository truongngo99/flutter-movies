import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/data/post/api.dart';
import 'package:flutter_movies/view/detail_search/detail_search_bloc.dart';
import 'package:flutter_movies/view/detail_search/detail_search_event.dart';
import 'package:flutter_movies/view/detail_search/detail_search_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class SearchScreenFilter extends StatefulWidget {
  final String keySearch;
  SearchScreenFilter({Key? key, required this.keySearch}) : super(key: key);

  @override
  _SearchScreenFilterState createState() => _SearchScreenFilterState();
}

class _SearchScreenFilterState extends BaseBlocState<SearchScreenFilter> {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => bloc as SearchBlocFilter)],
      child: BaseBlocBuilder<SearchStateFilter>(
          bloc as SearchBlocFilter, _buildBody));

  @override
  BaseBloc createBloc() => SearchBlocFilter(context.read<Api>())
    ..add(SearchEventFilter(search: widget.keySearch));

  Widget _buildBody(BuildContext context, SearchStateFilter state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.keySearch.toUpperCase()),
      ),
      body: Container(
        child: !(!state.isLoading && state.searchMultiModel != null)
            ? Center(
                child: !state.isLoading
                    ? Container()
                    : CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: state.searchMultiModel?.results?.length,
                itemBuilder: (context, index) {
                  String posterDefaul =
                      'https://www.mayacinemas.com/themes/web/images/default-movie.png';
                  String? poster =
                      state.searchMultiModel?.results![index].poster_path;
                  String posterUI =
                      'https://image.tmdb.org/t/p/original$poster';
                  String profileDefaul =
                      'https://st.quantrimang.com/photos/image/2017/04/08/anh-dai-dien-FB-200.jpg';
                  String? profile =
                      state.searchMultiModel?.results![index].profile_path;
                  String profileUI =
                      'https://image.tmdb.org/t/p/original$profile';
                  if (state.searchMultiModel?.results![index].media_type ==
                          'movie' ||
                      state.searchMultiModel?.results![index].media_type ==
                          'tv') {
                    var movieortv = state.searchMultiModel?.results![index];
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
                                    borderRadius: BorderRadius.circular(10)),
                                shadowColor: Colors.blueGrey,
                                elevation: 10,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 85,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          155,
                                      padding: EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movieortv!.name ??
                                                movieortv.title ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
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
                                                movieortv.release_date ?? '',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RatingBarIndicator(
                                                rating:
                                                    movieortv.vote_average! / 2,
                                                direction: Axis.horizontal,
                                                itemCount: 5,
                                                itemSize: 14,
                                                unratedColor: Colors.grey,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 1.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
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
                                            overflow: TextOverflow.ellipsis,
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
                                  poster == null ? posterDefaul : posterUI,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  var person = state.searchMultiModel?.results![index];
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
                                  borderRadius: BorderRadius.circular(10)),
                              shadowColor: Colors.blueGrey,
                              elevation: 10,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 85,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 155,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          person!.name ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Popularity: ',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              '${person.popularity}',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Known for Department:',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                        Text(
                                          '${person.known_for_department}',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 14),
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
                                profile == null ? profileDefaul : profileUI,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 50,
                          top: 60,
                          child: Container(
                              width: 10,
                              height: 10,
                              child: Icon(
                                Icons.person,
                                color: Colors.grey,
                              )),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
