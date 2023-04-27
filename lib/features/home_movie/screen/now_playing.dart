import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_test_getx/features/home_movie/index.dart';
import 'package:movie_app_test_getx/features/widgets/index.dart';
import 'package:movie_app_test_getx/models/index.dart';
import 'package:movie_app_test_getx/ui/widgets/custom_widgets/index.dart';

class NowPlayingMoviesTab extends GetView<NowPlayingMoviesController> {
  const NowPlayingMoviesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return CustomRefreshIndicator(
      onRefresh: controller.appendInitialMovies,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: controller.scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                controller.obx(
                  (MovieWrapper? movieWrapper) {
                    if (movieWrapper != null) {
                      return ProductList(
                        productList: movieWrapper.results,
                        isMovie: true,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                  onError: (String? msg) => const SizedBox(),
                  onEmpty: const SizedBox(),
                  onLoading: const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
