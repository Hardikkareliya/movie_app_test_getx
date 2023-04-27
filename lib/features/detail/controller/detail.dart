import 'package:get/get.dart';
import 'package:movie_app_test_getx/core/base/index.dart';
import 'package:movie_app_test_getx/models/index.dart';

import '../../sqlite/database_helper.dart';

class DetailPageController extends BaseController<Map<String, dynamic>> {
  DetailPageController();

  final RxInt currentIndex = 0.obs;
  Movie? movie;
  TvSeries? tvSeries;
  bool? isMovie;
  RxBool isFavorite = false.obs;
  List<Map<String, dynamic>> myFavoutriteListData = [];

  @override
  void onInit() {
    super.onInit();
    change(Get.arguments, status: RxStatus.success());
    movie = state?['movie'];
    tvSeries = state?['tvSeries'];
    isMovie = state?['isMovie'];

    checkIsFavourite(movie?.id.toString() ?? '');
  }

  // Insert a new data to the database
  Future<void> addItem(String? movieId, String? movieName, String? movieDesc, String? movieImage) async {
    await DatabaseHelper.createItem(movieId, movieName, movieDesc, movieImage);
    _refreshData();
    isFavorite.value = true;
  }

  // Remove a data to the database
  Future<void> removeItem(String movieId) async {
    await DatabaseHelper.deleteItem(movieId);
    _refreshData();
    isFavorite.value = false;
  }

  // This function is used to fetch all data from the database
  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    myFavoutriteListData = data;
  }

  void checkIsFavourite(String movieId) async {
    final data = await DatabaseHelper.getItem(movieId);

    var contain = data.any((element) => element.obs.value['movieId'] == movie?.id.toString());
    if (contain) {
      isFavorite.value = true;
    } else {
      isFavorite.value = false;
    }
  }
}
