import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_test_getx/features/home_movie/index.dart';
import 'package:movie_app_test_getx/features/home_movie/screen/now_playing.dart';
import 'package:movie_app_test_getx/ui/widgets/custom_widgets/index.dart';

class HomeMovieScreen extends GetView<HomeMovieScreenController> {
  const HomeMovieScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeMovieMobileScaffold();
  }
}

class HomeMovieMobileScaffold extends GetView<HomeMovieScreenController> {
  const HomeMovieMobileScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: NowPlayingMoviesTab(),
    );
  }
}
