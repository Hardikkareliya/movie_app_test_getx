import 'package:movie_app_test_getx/features/detail/controller/rating_row.dart';
import 'package:movie_app_test_getx/features/detail/index.dart';
import 'package:get/get.dart';

class DetailPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProvider>(() => DetailProvider());
    Get.lazyPut<DetailRepository>(() => DetailRepository());
    Get.lazyPut(() => DetailPageController());
    Get.lazyPut(() => RatingRowController(detailRepository: Get.find()));
  }
}
