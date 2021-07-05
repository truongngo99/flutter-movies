// import 'package:flutter/material.dart';
//  late final String? image;
// class HeaderSlider extends StatelessWidget {
//   const HeaderSlider({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//                 future: ApiClient(Dio()).getListMovieFopular(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     if (snapshot.hasData) {
//                       moviePopular = snapshot.data as MoviePopular?;
//                       image = moviePopular!.results;
//                       return CarouselSlider(
//                         items: image.map((e) {
//                           return Builder(
//                             builder: (BuildContext context) {
//                               return Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   //margin: EdgeInsets.symmetric(horizontal: 5.0),
//                                   child: Image.network(
//                                       'https://image.tmdb.org/t/p/original${e.backdrop_path ?? ''}'));
//                             },
//                           );
//                         }).toList(),
//                         options: CarouselOptions(
//                           autoPlay: true,
//                           aspectRatio: 2.0,
//                           height: 180,
//                           enlargeCenterPage: true,
//                         ),
//                       );
//                     }
//                   }
//                   return Center(child: CircularProgressIndicator());
//                 },
//               ),;
//   }
// }