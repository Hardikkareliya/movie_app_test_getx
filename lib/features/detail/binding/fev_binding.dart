import 'package:get/get.dart';
import 'package:movie_app_test_getx/features/detail/controller/rating_row.dart';
import 'package:movie_app_test_getx/features/detail/index.dart';

class FavouriteMoviePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoutriteListPageController());
    Get.lazyPut<DetailProvider>(() => DetailProvider());
    Get.lazyPut<DetailRepository>(() => DetailRepository());
    Get.lazyPut(() => DetailPageController());
    Get.lazyPut(() => RatingRowController(detailRepository: Get.find()));
  }
}
