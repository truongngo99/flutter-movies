import 'package:flutter_movies/data/response/authentication/create_session.dart';
import 'package:flutter_movies/data/response/authentication/login_body.dart';
import 'package:flutter_movies/data/response/authentication/request_token.dart';
import 'package:flutter_movies/data/response/image/image_model.dart';
import 'package:flutter_movies/data/response/movie/movie_model.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

abstract class Api {
  Method get getRequest =>
      GET('authentication/token/new?api_key=a7e38c80a0efc42034dfb5c8b95a72cb');
  Future<RequestToken> getRequestToken();
  Method get postLogin => POST(
      'authentication/token/validate_with_login?api_key=a7e38c80a0efc42034dfb5c8b95a72cb');
  Future<RequestToken> login(LoginBody loginBody);

  Method get postSession => POST(
      'authentication/session/new?api_key=a7e38c80a0efc42034dfb5c8b95a72cb');
  Future<CreateSession> createSession(String requestToken);

  Method get moviePopular =>
      GET('movie/popular?api_key=a7e38c80a0efc42034dfb5c8b95a72cb');
  Future<MovieModel> getListMovieFopular();

  Method get movieNowPlaying =>
      GET('movie/now_playing?api_key=a7e38c80a0efc42034dfb5c8b95a72cb');
  Future<MovieModel> getListMoviePlaying();

  Method get movieTrending =>
      GET('trending/all/day?api_key=a7e38c80a0efc42034dfb5c8b95a72cb');
  Future<MovieModel> getListMovieTrending();

  Method get movieTopRate =>
      GET('movie/top_rated?api_key=a7e38c80a0efc42034dfb5c8b95a72cb');
  Future<MovieModel> getListMovieTopRate();

  Method get movieUpcoming =>
      GET('movie/upcoming?api_key=a7e38c80a0efc42034dfb5c8b95a72cb');
  Future<MovieModel> getListMovieUpcoming();

  Method get posterMovie =>
      GET('movie/{movie_id}/images?api_key=a7e38c80a0efc42034dfb5c8b95a72cb');
  Future<ImageModel> getPosterMovie(String movieId);

  // @GET('movie/{movie_id}/reviews?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  // Future<ReviewMovieModel> getReviewMovie(@Path('movie_id') String movieId);

  // @GET('movie/{movie_id}/credits?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  // Future<CastCrew> getCastCrewMovie(@Path('movie_id') String movieId);

  // @GET('movie/{movie_id}/videos?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  // Future<Trailer> getTrailerMovie(@Path('movie_id') String movieId);

  // @GET('/person/{castId}?api_key=a7e38c80a0efc42034dfb5c8b95a72cb')
  // Future<PersonCaster> getProfileCasterMovie(@Path('castId') String castId);
}

class ApiUrl extends BaseUrl {
  @override
  String dev() => 'https://api.themoviedb.org/3/';

  @override
  String prod() {
    // TODO: implement prod
    throw UnimplementedError();
  }

  @override
  String stg() {
    // TODO: implement stg
    throw UnimplementedError();
  }
}
