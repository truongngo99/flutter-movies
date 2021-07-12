import 'package:flutter_movies/data/response/authentication/create_session.dart';
import 'package:flutter_movies/data/response/authentication/request_token.dart';
import 'package:flutter_movies/data/response/image/image_model.dart';
import 'package:flutter_movies/data/response/movie/movie_model.dart';
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
}
