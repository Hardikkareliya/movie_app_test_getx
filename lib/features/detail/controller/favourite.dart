import 'package:get/get.dart';
import 'package:movie_app_test_getx/core/base/index.dart';
import 'package:movie_app_test_getx/features/sqlite/database_helper.dart';

class FavoutriteListPageController extends BaseController<dynamic> {
  FavoutriteListPageController();
  List<Map<String, dynamic>> myFavoutriteListData = [];

  @override
  void onInit() {
    super.onInit();
    change(Get.arguments, status: RxStatus.success());
    getAllFavouriteMovies();
  }

  // This function is used to fetch all data from the database
  getAllFavouriteMovies() async {
    final data = await DatabaseHelper.getItems();
    myFavoutriteListData.obs.value = data;
  }
}
