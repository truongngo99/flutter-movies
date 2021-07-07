import 'package:dio/dio.dart';
import 'package:flutter_movies/models/authentication/create_session.dart';

import 'package:flutter_movies/models/authentication/login_body.dart';
import 'package:flutter_movies/models/authentication/request_token.dart';
import 'package:flutter_movies/models/image/image_model.dart';
import 'package:flutter_movies/models/movie_now_playing/movie_now_playing.dart';

import 'package:flutter_movies/models/movie_popular/movie_popular.dart';
import 'package:flutter_movies/models/movie_trending/movie_trending_model.dart';
import 'package:flutter_movies/models/review_movie/review_movie_model.dart';
import 'package:retrofit/http.dart';
part 'api.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('authentication/token/new?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<RequestToken> getRequestToken();

  @POST(
      'authentication/token/validate_with_login?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<RequestToken> login(@Body() LoginBody loginBody);

  @POST('authentication/session/new?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<CreateSession> createSession(
      @Query('request_token') String requestToken);

  @GET('movie/popular?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<MoviePopular> getListMovieFopular();

  @GET('movie/now_playing?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<MovieNowPlayingModel> getListMoviePlaying();

  @GET('trending/all/day?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<MovieTrendingModel> getListMovieTrending();

  @GET('movie/top_rated?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<MovieTrendingModel> getListMovieTopRate();

  @GET('movie/upcoming?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<MovieNowPlayingModel> getListMovieUpcoming();

  @GET('movie/{movie_id}/images?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<ImageModel> getPosterMovie(@Path('movie_id') String movieId);

  @GET('movie/{movie_id}/reviews?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<ReviewMovieModel> getReviewMovie(@Path('movie_id') String movieId);
}
