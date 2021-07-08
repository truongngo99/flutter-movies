import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/get_poster/get_poster_bloc.dart';
import 'package:flutter_movies/bloc/get_poster/get_poster_event.dart';
import 'package:flutter_movies/bloc/get_poster/get_poster_state.dart';
import 'package:flutter_movies/bloc/review_movie/reivew_movie_state.dart';
import 'package:flutter_movies/bloc/review_movie/review_movie.evetn.dart';
import 'package:flutter_movies/bloc/review_movie/review_movie_bloc.dart';
import 'package:flutter_movies/view/cast_crew/cast_crew_bloc.dart';
import 'package:flutter_movies/view/cast_crew/cast_crew_event.dart';
import 'package:flutter_movies/view/cast_crew/cast_crew_state.dart';
import 'package:flutter_movies/view/caster/caster_bloc.dart';
import 'package:flutter_movies/view/caster/caster_event.dart';
import 'package:flutter_movies/view/caster/caster_screen.dart';
import 'package:flutter_movies/view/screen/backdrop_screen.dart';
import 'package:flutter_movies/view/screen/poster_screen.dart';
import 'package:flutter_movies/view/trailer/trailer_bloc.dart';
import 'package:flutter_movies/view/trailer/trailer_event.dart';
import 'package:flutter_movies/view/trailer/trailer_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends StatefulWidget {
  final String? urlBackdrop;
  final String? urlPoster;
  final String? title;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final String? overView;
  final int id;
  DetailScreen(
      {Key? key,
      this.urlBackdrop,
      this.urlPoster,
      this.title,
      this.releaseDate,
      this.voteAverage,
      this.voteCount,
      this.overView,
      required this.id})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReviewMovieBloc>(context)
        .add(ReviewMovieEventStart(movieId: widget.id.toString()));
    BlocProvider.of<CastCewBloc>(context)
        .add(CastCrewEventStart(movieId: widget.id.toString()));
    BlocProvider.of<TrailerBloc>(context)
        .add(TrailerEventStart(movieId: widget.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C262f),
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 230,
              backgroundColor: Colors.transparent,
              collapsedHeight: 110,
              floating: false,
              pinned: true,
              flexibleSpace: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      BlocProvider.of<GetPosterBloc>(context).add(
                          GetPosterEventStart(movieId: widget.id.toString()));
                      transferToNewScreen(
                        context,
                        BackDropScreen(
                          title: widget.title ?? '',
                        ),
                      );
                    },
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original${widget.urlBackdrop}??'
                      '',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 250,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    left: 10,
                    child: Container(
                      height: 130,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () async {
                              BlocProvider.of<GetPosterBloc>(context).add(
                                  GetPosterEventStart(
                                      movieId: widget.id.toString()));
                              transferToNewScreen(
                                context,
                                PosterScreen(
                                  title: widget.title ?? '',
                                ),
                              );
                            },
                            child: Image.network(
                              'https://image.tmdb.org/t/p/original${widget.urlPoster}',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 90,
                                child: Text(
                                  '${widget.title}',
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text('${widget.releaseDate}',
                                  style: TextStyle(color: Colors.grey[350])),
                            ],
                          ),
                          SizedBox(
                            width: 55,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: RatingBarIndicator(
                                  rating: widget.voteAverage! / 2,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 20,
                                  unratedColor: Colors.grey,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                              Text(
                                '${widget.voteCount}',
                                style: TextStyle(
                                  color: Colors.grey[350],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, left: 5),
                            child: Text(
                              '${widget.voteAverage}',
                              style: TextStyle(
                                  color: Colors.grey[350],
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overview',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                Text('     ${widget.overView}',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white.withOpacity(0.7),
                      fontStyle: FontStyle.italic,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Cast',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 15,
                  ),
                  height: 100,
                  child: BlocBuilder<CastCewBloc, CastCrewState>(
                    builder: (context, CastCrewState state) {
                      if (state is CastCrewStateSuccess) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.castCrew!.cast!.length,
                            itemBuilder: (context, index) {
                              String imageDefault =
                                  'https://st.quantrimang.com/photos/image/2017/04/08/anh-dai-dien-FB-200.jpg';
                              return InkWell(
                                onTap: () {
                                  BlocProvider.of<CasterBloc>(context).add(
                                      CasterClickEvent(state
                                          .castCrew!.cast![index].id
                                          .toString()));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CasterScreen()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://image.tmdb.org/t/p/original${state.castCrew!.cast![index].profile_path}'),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${state.castCrew!.cast![index].name}',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Crew',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 15,
                  ),
                  height: 100,
                  width: double.infinity,
                  child: BlocBuilder<CastCewBloc, CastCrewState>(
                    builder: (context, CastCrewState state) {
                      if (state is CastCrewStateSuccess) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.castCrew!.crew!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 15),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/original${state.castCrew!.crew![index].profile_path}'),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${state.castCrew!.crew![index].name}',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7)),
                                    )
                                  ],
                                ),
                              );
                            });
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Trailer',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                Container(
                    height: 130,
                    child: BlocBuilder<TrailerBloc, TrailerState>(
                        builder: (context, TrailerState state) {
                      if (state is TrailerStateSuccess) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.trailer!.results!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Image.network(
                                      'https://img.youtube.com/vi/${state.trailer!.results![index].key}/0.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                    Container(
                                      width: 160,
                                      child: Text(
                                        state.trailer!.results![index].name,
                                        style: TextStyle(color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 40),
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Colors.grey,
                                        size: 50,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    })),
                // Text(
                //   'Reviews',
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                // BlocBuilder<ReviewMovieBloc, ReviewMovieState>(
                //     builder: (context, ReviewMovieState state) {
                //   if (state is ReviewMovieStateSucess) {
                //     String imageDefault =
                //         'https://st.quantrimang.com/photos/image/2017/04/08/anh-dai-dien-FB-200.jpg';
                //     return Container(
                //       height: 300,
                //       child: ListView.builder(
                //           itemCount: state.reviewMovieModel!.results!.length,
                //           itemBuilder: (context, index) {
                //             var urlAvatarPath = state.reviewMovieModel!
                //                 .results![index].author_details!.avatar_path;
                //             urlAvatarPath = urlAvatarPath!.substring(1);
                //             return Container(
                //               padding: EdgeInsets.only(left: 5),
                //               height: 250,
                //               width: double.infinity,
                //               child: Row(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   CircleAvatar(
                //                     backgroundImage:
                //                         NetworkImage('$urlAvatarPath'),
                //                   ),
                //                   SizedBox(
                //                     width: 10,
                //                   ),
                //                   Container(
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           '${state.reviewMovieModel!.results![index].author}'
                //                               .toUpperCase(),
                //                           style: TextStyle(
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 18,
                //                           ),
                //                         ),
                //                         SizedBox(
                //                           width: 10,
                //                         ),
                //                         Row(
                //                           children: [
                //                             Icon(
                //                               Icons.access_alarm,
                //                               size: 15,
                //                               color: Colors.grey[500],
                //                             ),
                //                             SizedBox(
                //                               width: 4,
                //                             ),
                //                             Text(
                //                               '${state.reviewMovieModel!.results![index].updated_at}',
                //                               style: TextStyle(
                //                                 color: Colors.grey[500],
                //                                 fontSize: 15,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                         Container(
                //                           width: MediaQuery.of(context)
                //                                   .size
                //                                   .width -
                //                               75,
                //                           child: Text(
                //                             '${state.reviewMovieModel!.results![index].content}',
                //                             overflow: TextOverflow.ellipsis,
                //                             maxLines: 10,
                //                             style: TextStyle(
                //                               // color: Colors.grey[500],
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.w400,
                //                             ),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             );
                //           }),
                //     );
                //   }
                //   return CircularProgressIndicator();
                // }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
