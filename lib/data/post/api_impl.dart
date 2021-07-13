import 'package:flutter_movies/data/response/authentication/create_session.dart';
import 'package:flutter_movies/data/response/authentication/request_token.dart';
import 'package:flutter_movies/data/response/cast_crew/cast_crew.dart';
import 'package:flutter_movies/data/response/image/image_model.dart';
import 'package:flutter_movies/data/response/movie/movie_model.dart';
import 'package:flutter_movies/data/response/person_id/person_id.dart';
import 'package:flutter_movies/data/response/review_movie/review_movie_model.dart';
import 'package:flutter_movies/data/response/trailer/trailer.dart';
import 'package:teq_flutter_core/teq_flutter_core.dart';

import 'api.dart';

class ApiImpl extends BaseAPI with Api {
  @override
  Future<RequestToken> getRequestToken() async {
    return RequestToken.fromJson(await sendApiRequest(getRequest));
  }

  @override
  Future<RequestToken> login(loginBody) async {
    return RequestToken.fromJson(
        await sendApiRequest(postLogin, body: loginBody.toJson()));
  }

  @override
  Future<CreateSession> createSession(String requestToken) async {
    return CreateSession.fromJson(
        await sendApiRequest(postSession, queryParameters: {
      'request_token': requestToken,
    }));
  }

  @override
  Future<ImageModel> getPosterMovie(String movieId) async {
    print('path mac dinh: ${posterMovie.path}');

    posterMovie.setPath('movie_id', movieId);
    // posterMovie.path.replaceAll('{movie_id}', movieId);

    print('path sau khi thay doi: ${posterMovie.path}');

    var url = posterMovie.path;
    url = url.replaceAll('{movie_id}', movieId);
    var newPath = GET(url);

    return ImageModel.fromJson(await sendApiRequest(newPath));
  }

  @override
  Future<MovieModel> getListMovieFopular() async {
    return MovieModel.fromJson(await sendApiRequest(moviePopular));
  }

  @override
  Future<MovieModel> getListMoviePlaying() async {
    return MovieModel.fromJson(await sendApiRequest(movieNowPlaying));
  }

  @override
  Future<MovieModel> getListMovieTopRate() async {
    return MovieModel.fromJson(await sendApiRequest(movieTopRate));
  }

  @override
  Future<MovieModel> getListMovieTrending() async {
    return MovieModel.fromJson(await sendApiRequest(movieTrending));
  }

  @override
  Future<MovieModel> getListMovieUpcoming() async {
    return MovieModel.fromJson(await sendApiRequest(movieUpcoming));
  }

  @override
  Future<ReviewMovieModel> getReviewMovie(String movieId) async {
    var url = getReview.path;
    url = url.replaceAll('{movie_id}', movieId);
    var newPath = GET(url);

    return ReviewMovieModel.fromJson(await sendApiRequest(newPath));
  }

  @override
  Future<CastCrew> getCastCrewMovie(String movieId) async {
    var url = getCastCrew.path;
    url = url.replaceAll('{movie_id}', movieId);
    var newPath = GET(url);
    return CastCrew.fromJson(await sendApiRequest(newPath));
  }

  @override
  Future<PersonCaster> getProfileCasterMovie(String castId) async {
    var url = getProfile.path;
    url = url.replaceAll('{castId}', castId);
    var newPath = GET(url);
    return PersonCaster.fromJson(await sendApiRequest(newPath));
  }

  @override
  Future<Trailer> getTrailerMovie(String movieId) async {
    var url = getTrailer.path;
    url = url.replaceAll('{movie_id}', movieId);
    var newPath = GET(url);
    return Trailer.fromJson(await sendApiRequest(newPath));
  }
}
