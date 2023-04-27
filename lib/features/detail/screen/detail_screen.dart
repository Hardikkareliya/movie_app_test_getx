import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_test_getx/features/detail/index.dart';
import 'package:movie_app_test_getx/features/widgets/index.dart';
import 'package:movie_app_test_getx/routes/app_routes.dart';
import 'package:nil/nil.dart';

class DetailScreen extends GetView<DetailPageController> {
  const DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: controller.isMovie == null
                  ? nil
                  : (controller.isMovie ?? false)
                      ? Column(
                          children: <Widget>[
                            HeaderDetail(
                              title: controller.movie!.title ?? "",
                              imageBanner: 'https://image.tmdb.org/t/p/original${controller.movie!.backdropPath ?? ""}',
                              imagePoster: 'https://image.tmdb.org/t/p/w185${controller.movie!.posterPath ?? ""}',
                              rating: double.parse(controller.movie!.voteAverage ?? "0"),
                              genre: controller.movie?.genres?.map(createGenreContainer).toList() ?? <Widget>[],
                              id: controller.movie!.id!,
                              isMovie: true,
                              releaseDate: controller.movie?.releaseDate ?? '0',
                            ),
                            const DetailTabNavigation(),
                            const SizedBox(height: 10),
                          ],
                        )
                      : Column(
                          children: <Widget>[
                            HeaderDetail(
                              title: controller.tvSeries!.name ?? "",
                              imageBanner: 'https://image.tmdb.org/t/p/original${controller.tvSeries!.backdropPath ?? ""}',
                              imagePoster: 'https://image.tmdb.org/t/p/w185${controller.tvSeries!.posterPath ?? ""}',
                              rating: double.parse(controller.tvSeries!.voteAverage ?? "0"),
                              genre: controller.tvSeries?.genres?.map(createGenreContainer).toList() ?? <Widget>[],
                              id: controller.tvSeries!.id!,
                              isMovie: false,
                              releaseDate: controller.tvSeries?.firstAirDate ?? '0',
                            ),
                            const DetailTabNavigation(),
                            const SizedBox(height: 10),
                          ],
                        ),
            ),
          ),
          Positioned(
            top: 50,
            left: 15,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 36,
                color: Colors.white,
              ),
              onPressed: Get.back,
            ),
          ),
          Positioned(
            top: 50,
            right: 15,
            child: IconButton(
              icon: const Icon(
                Icons.list_alt,
                size: 36,
                color: Colors.white,
              ),
              onPressed: () {
                Get.toNamed(
                  AppRoutes.FAV_LIST,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DetailTabNavigation extends GetView<DetailPageController> {
  const DetailTabNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _detailTabs = <Widget>[
      Text(
        controller.isMovie != null
            ? controller.isMovie!
                ? controller.movie!.overview ?? ""
                : controller.tvSeries!.overview ?? ""
            : "",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Get.isDarkMode ? Colors.white : Colors.black45,
              fontSize: 16.0,
            ),
      ),
    ];
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: [
            Container(
              // width: size.width,
              height: 70,
              // color: Get.isDarkMode ? Colors.white12 : Colors.grey[200],
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: ((size.width - (_detailTabs.length - 1 * 15)) / _detailTabs.length) - 90,
                    height: 50,
                    child: GestureDetector(
                      onTap: () {
                        if (controller.currentIndex.value != 0) {
                          controller.currentIndex.value = 0;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? Colors.white12 : Colors.white70,
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Overview",
                            style: TextStyle(
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              return IconButton(
                icon: Icon(
                  Get.find<DetailPageController>().isFavorite.isTrue ? Icons.favorite : Icons.favorite_border_outlined,
                  size: 36,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (Get.find<DetailPageController>().isFavorite.isTrue) {
                    Get.find<DetailPageController>().removeItem(controller.movie?.id.toString() ?? "");
                  } else {
                    Get.find<DetailPageController>().addItem(controller.movie?.id.toString(), controller.movie?.title.toString(),
                        controller.movie?.overview.toString(), controller.movie?.posterPath.toString());
                  }
                },
              );
            }),
          ],
        ),
        SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() => _detailTabs[controller.currentIndex.value]),
          ),
        ),
      ],
    );
  }
}
