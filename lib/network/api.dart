import 'package:dio/dio.dart';
import 'package:flutter_movies/data/response/authentication/create_session.dart';
import 'package:flutter_movies/data/response/authentication/login_body.dart';
import 'package:flutter_movies/data/response/authentication/request_token.dart';
import 'package:flutter_movies/data/response/cast_crew/cast_crew.dart';

import 'package:flutter_movies/data/response/movie/movie_model.dart';
import 'package:flutter_movies/data/response/person_id/person_id.dart';
import 'package:flutter_movies/data/response/review_movie/review_movie_model.dart';
import 'package:flutter_movies/data/response/trailer/trailer.dart';

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
  Future<MovieModel> getListMovieFopular();

  @GET('movie/now_playing?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<MovieModel> getListMoviePlaying();

  @GET('trending/all/day?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<MovieModel> getListMovieTrending();

  @GET('movie/top_rated?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<MovieModel> getListMovieTopRate();

  @GET('movie/upcoming?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<MovieModel> getListMovieUpcoming();

  // @GET('movie/{movie_id}/images?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  // Future<ImageModel> getPosterMovie(@Path('movie_id') String movieId);

  @GET('movie/{movie_id}/reviews?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<ReviewMovieModel> getReviewMovie(@Path('movie_id') String movieId);

  @GET('movie/{movie_id}/credits?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<CastCrew> getCastCrewMovie(@Path('movie_id') String movieId);

  @GET('movie/{movie_id}/videos?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<Trailer> getTrailerMovie(@Path('movie_id') String movieId);

  @GET('/person/{castId}?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  Future<PersonCaster> getProfileCasterMovie(@Path('castId') String castId);
}
