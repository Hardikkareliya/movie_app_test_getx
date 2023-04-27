import 'package:get/get.dart';
import 'package:movie_app_test_getx/features/detail/binding/fev_binding.dart';
import 'package:movie_app_test_getx/features/detail/index.dart';
import 'package:movie_app_test_getx/features/detail/screen/fav_list_screen.dart';
import 'package:movie_app_test_getx/features/home_movie/binding/home_movie_binding.dart';
import 'package:movie_app_test_getx/features/home_movie/screen/home_movie_screen.dart';
import 'package:movie_app_test_getx/routes/index.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<HomeMovieScreen>(
      name: AppRoutes.HOME_MOVIE,
      page: () => const HomeMovieScreen(),
      transition: Transition.fadeIn,
      binding: HomeMovieBinding(),
      preventDuplicates: true,
    ),
    GetPage<DetailScreen>(
      name: AppRoutes.DETAIL,
      page: () => const DetailScreen(),
      transition: Transition.fadeIn,
      binding: DetailPageBinding(),
      preventDuplicates: true,
    ),
    GetPage<FavouriteListScreen>(
      name: AppRoutes.FAV_LIST,
      page: () => const FavouriteListScreen(),
      transition: Transition.fadeIn,
      binding: FavouriteMoviePageBinding(),
      preventDuplicates: true,
    ),
  ];
}
