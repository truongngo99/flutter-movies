import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/data/post/api.dart';
import 'package:flutter_movies/data/response/cast_crew/cast.dart';
import 'package:flutter_movies/data/response/movie/movie_model.dart';
import 'package:flutter_movies/data/response/movie/result_movie.dart';
import 'package:flutter_movies/view/detail_search/detail_search_screen.dart';
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
  String? textValue;
  Timer? timeHandle;
  @override
  Widget build(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => bloc as SearchBloc),
      ], child: BaseBlocBuilder<SearchState>(bloc as SearchBloc, _buildBody));

  @override
  BaseBloc createBloc() => SearchBloc(context.read<Api>());

  void textChanged(String val) {
    textValue = val;
    if (timeHandle != null) {
      timeHandle!.cancel();
    }
    timeHandle = Timer(Duration(seconds: 1), () {
      addEvent(SearchEvent(search: textValue ?? ''));
    });
  }

  Widget _buildBody(BuildContext context, SearchState state) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: textValue,
                onChanged: textChanged,
                decoration: InputDecoration(
                  hintText: 'Search Films',
                  border: OutlineInputBorder(),
                ),
              ),
              state.searchKeyModel == null
                  ? Container()
                  : Container(
                      height: 300,
                      child: state.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: state.searchKeyModel?.results?.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchScreenFilter(
                                                    keySearch: state
                                                            .searchKeyModel
                                                            ?.results?[index]
                                                            .name ??
                                                        '')));
                                  },
                                  title: Text(
                                      '${state.searchKeyModel?.results?[index].name}'),
                                );
                              }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
