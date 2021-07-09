import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/view/caster/caster_bloc.dart';
import 'package:flutter_movies/view/caster/caster_event.dart';
import 'package:flutter_movies/view/caster/caster_state.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

class CasterScreen extends StatefulWidget {
  final String id;
  const CasterScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CasterScreenState();
}

class _CasterScreenState extends BaseBlocState<CasterScreen> {
  @override
  Widget build(BuildContext context) =>
      BaseBlocBuilder<CasterStateSuccess>(bloc as CasterBloc, _buildBody);

  @override
  BaseBloc createBloc() => CasterBloc()..add(CasterClickEvent(widget.id));

  Widget _buildBody(BuildContext context, CasterStateSuccess state) {
    return Scaffold(
        backgroundColor: Color(0xff1C262f),
        //appBar: AppBar(),
        body: state.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        expandedHeight: 200,
                        floating: false,
                        pinned: true,
                        collapsedHeight: 100,
                        flexibleSpace: Container(
                          width: double.infinity,
                          height: 200,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      'https://image.tmdb.org/t/p/original${state.personCaster!.profile_path}'),
                                ),
                              ),
                              Positioned(
                                bottom: 40,
                                child: Text(
                                  '${state.personCaster!.name}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Text(
                                    '${state.personCaster!.place_of_birth}',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                  body: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            shadowColor: Colors.grey,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Icon(
                                    Icons.cake,
                                    size: 50,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Birthday:',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.redAccent),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${state.personCaster!.birthday}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            shadowColor: Colors.grey,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Icon(
                                    Icons.cake,
                                    size: 50,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Knowfor:',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.redAccent),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${state.personCaster!.known_for_department}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            shadowColor: Colors.grey,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Icon(
                                    Icons.favorite,
                                    size: 50,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Popularity:',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.redAccent),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${state.personCaster!.popularity}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.cake,
                        //       color: Colors.white.withOpacity(0.8),
                        //       size: 30,
                        //     ),
                        //     Text(
                        //       'Birthday:',
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //     Text('${state.personCaster!.birthday}')
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ));
  }
}
