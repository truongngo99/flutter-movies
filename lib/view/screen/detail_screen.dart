import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreen extends StatefulWidget {
  final String? urlBackdrop;
  final String? urlPoster;
  final String? title;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  DetailScreen(
      {Key? key,
      this.urlBackdrop,
      this.urlPoster,
      this.title,
      this.releaseDate,
      this.voteAverage,
      this.voteCount})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 22),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/original${widget.urlBackdrop}??'
                    '',
                    fit: BoxFit.fill,
                    width: double.infinity,
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
                          Image.network(
                            'https://image.tmdb.org/t/p/original${widget.urlPoster}',
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
                                      color: Colors.grey[800],
                                      fontSize: 16,
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
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
