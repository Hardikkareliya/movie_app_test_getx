import 'package:movie_app_test_getx/features/home_movie/index.dart';
import 'package:get/get.dart';

class HomeMovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMovieProvider>(() => HomeMovieProvider());
    Get.lazyPut<HomeMovieRepository>(() => HomeMovieRepository());
    Get.lazyPut(() => HomeMovieScreenController());
    Get.lazyPut(() => NowPlayingMoviesController(homeMovieRepository: Get.find()));
  }
}
