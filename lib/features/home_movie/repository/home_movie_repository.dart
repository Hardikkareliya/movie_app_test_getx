import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_test_getx/core/base/index.dart';
import 'package:movie_app_test_getx/models/index.dart';
import 'package:movie_app_test_getx/network/index.dart';

abstract class IHomeMovieProvider {
  Future<Response<MovieWrapper>> getNowPlayingMovie({required String path, Map<String, dynamic>? query});
}

class HomeMovieProvider extends BaseProvider implements IHomeMovieProvider {
  @override
  InternalFinalCallback<void> get onStart {
    httpClient.defaultDecoder = (dynamic val) => MovieWrapper.fromJson(val as Map<String, dynamic>);
    return super.onStart;
  }

  @override
  Future<Response<MovieWrapper>> getNowPlayingMovie({required String path, Map<String, dynamic>? query}) => get(path, query: query);
}

abstract class IHomeMovieRepository {
  Future<MovieWrapper?> getNowPlayingMovie({Map<String, dynamic>? query});
}

class HomeMovieRepository extends BaseRepository<HomeMovieProvider> implements IHomeMovieRepository {
  HomeMovieRepository() : super(provider: HomeMovieProvider());

  @override
  Future<MovieWrapper?> getNowPlayingMovie({Map<String, dynamic>? query}) async {
    final Response<MovieWrapper> response = await provider.getNowPlayingMovie(path: Url.nowPlayingMovies, query: query);
    debugPrint("NowPlayingMoviesResponse: ${response.body}");
    if (response.status.hasError) {
      debugPrint("NowPlayingMovieError: ${response.statusText}");
      return Future<MovieWrapper>.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
