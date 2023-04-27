import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_test_getx/features/widgets/index.dart';
import 'package:movie_app_test_getx/models/index.dart';
import 'package:movie_app_test_getx/network/index.dart';
import 'package:movie_app_test_getx/routes/index.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.productList,
    required this.isMovie,
  }) : super(key: key);

  final List<dynamic>? productList;
  final bool isMovie;

  Widget getProductCard({
    required bool isMovie,
    required List<Movie>? movieList,
    required List<TvSeries>? tvSeriesList,
    required int index,
    required double aspectRatio,
  }) {
    if (isMovie) {
      return ProductCard(
        image: movieList?[index].posterPath != null ? 'https://image.tmdb.org/t/p/w185${movieList?[index].posterPath}' : Url.appLogoUrl,
        title: movieList?[index].title ?? "",
        vote: movieList?[index].voteAverage ?? "",
        releaseDate: movieList?[index].releaseDate ?? "",
        overview: movieList?[index].overview ?? "",
        genre: movieList?[index].genres != null ? movieList![index].genres!.map(createGenreContainer).toList() : <Widget>[],
        aspectRatio: aspectRatio,
        onTap: () {
          Get.toNamed(
            AppRoutes.DETAIL,
            arguments: <String, dynamic>{
              'movie': movieList?[index],
              'isMovie': true,
            },
          );
        },
      );
    } else {
      return ProductCard(
        image: tvSeriesList?[index].posterPath != null ? 'https://image.tmdb.org/t/p/w185${tvSeriesList?[index].posterPath}' : Url.appLogoUrl,
        title: tvSeriesList?[index].name ?? "",
        vote: tvSeriesList?[index].voteAverage ?? "",
        releaseDate: tvSeriesList?[index].firstAirDate ?? "",
        overview: tvSeriesList?[index].overview ?? "",
        genre: tvSeriesList?[index].genres != null ? tvSeriesList![index].genres!.map(createGenreContainer).toList() : <Widget>[],
        aspectRatio: aspectRatio,
        onTap: () {
          Get.toNamed(
            AppRoutes.DETAIL,
            arguments: <String, dynamic>{
              'tvSeries': tvSeriesList?[index],
              'isMovie': false,
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie>? movieList = isMovie ? productList as List<Movie>? : <Movie>[];
    final List<TvSeries>? tvSeriesList = !isMovie ? productList as List<TvSeries>? : <TvSeries>[];
    movieList?.sort(
      (a, b) {
        return (a.title ?? '').toLowerCase().compareTo((b.title ?? '').toLowerCase());
      },
    );
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        if (boxConstraints.maxWidth >= 1700) {
          const double aspectRatio = 2;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 0,
              childAspectRatio: aspectRatio,
            ),
            itemCount: (isMovie ? movieList : tvSeriesList)?.length ?? 0,
            cacheExtent: (Get.context?.width ?? Get.width) / aspectRatio,
            itemBuilder: (BuildContext context, int index) {
              return getProductCard(
                isMovie: isMovie,
                movieList: movieList,
                tvSeriesList: tvSeriesList,
                index: index,
                aspectRatio: aspectRatio,
              );
            },
          );
        } else if (boxConstraints.maxWidth >= 1300) {
          const double aspectRatio = 1.75;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 0,
              childAspectRatio: aspectRatio,
            ),
            itemCount: (isMovie ? movieList : tvSeriesList)?.length ?? 0,
            cacheExtent: (Get.context?.width ?? Get.width) / aspectRatio,
            itemBuilder: (BuildContext context, int index) {
              return getProductCard(
                isMovie: isMovie,
                movieList: movieList,
                tvSeriesList: tvSeriesList,
                index: index,
                aspectRatio: aspectRatio,
              );
            },
          );
        } else if (boxConstraints.maxWidth >= 1000) {
          const double aspectRatio = 1.75;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              childAspectRatio: aspectRatio,
            ),
            itemCount: (isMovie ? movieList : tvSeriesList)?.length ?? 0,
            cacheExtent: (Get.context?.width ?? Get.width) / aspectRatio,
            itemBuilder: (BuildContext context, int index) {
              return getProductCard(
                isMovie: isMovie,
                movieList: movieList,
                tvSeriesList: tvSeriesList,
                index: index,
                aspectRatio: aspectRatio,
              );
            },
          );
        } else if (boxConstraints.maxWidth >= 600) {
          const double aspectRatio = 1.75;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              childAspectRatio: aspectRatio,
            ),
            itemCount: (isMovie ? movieList : tvSeriesList)?.length ?? 0,
            cacheExtent: (Get.context?.width ?? Get.width) / aspectRatio,
            itemBuilder: (BuildContext context, int index) {
              return getProductCard(
                isMovie: isMovie,
                movieList: movieList,
                tvSeriesList: tvSeriesList,
                index: index,
                aspectRatio: aspectRatio,
              );
            },
          );
        } else if (boxConstraints.maxWidth <= 280) {
          const double aspectRatio = 2;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              childAspectRatio: aspectRatio,
            ),
            itemCount: (isMovie ? movieList : tvSeriesList)?.length ?? 0,
            cacheExtent: (Get.context?.width ?? Get.width) / aspectRatio,
            itemBuilder: (BuildContext context, int index) {
              return ProductCardSmall(
                image: isMovie
                    ? (movieList?[index].posterPath != null)
                        ? 'https://image.tmdb.org/t/p/w185${movieList?[index].posterPath}'
                        : Url.appLogoUrl
                    : (tvSeriesList?[index].posterPath != null)
                        ? 'https://image.tmdb.org/t/p/w185${tvSeriesList?[index].posterPath}'
                        : Url.appLogoUrl,
                title: isMovie ? (movieList?[index].title ?? "") : (tvSeriesList?[index].name ?? ""),
                maxWidth: boxConstraints.maxWidth,
                aspectRatio: aspectRatio,
                onTap: () {
                  if (isMovie) {
                    Get.toNamed(
                      AppRoutes.DETAIL,
                      arguments: <String, dynamic>{
                        'movie': movieList?[index],
                        'isMovie': true,
                      },
                    );
                  } else {
                    Get.toNamed(
                      AppRoutes.DETAIL,
                      arguments: <String, dynamic>{
                        'tvSeries': tvSeriesList?[index],
                        'isMovie': false,
                      },
                    );
                  }
                },
              );
            },
          );
        } else {
          const double aspectRatio = 2.1;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            itemCount: (isMovie ? movieList : tvSeriesList)?.length ?? 0,
            itemExtent: (Get.context?.width ?? Get.width) / aspectRatio,
            itemBuilder: (BuildContext context, int index) {
              return getProductCard(
                isMovie: isMovie,
                movieList: movieList,
                tvSeriesList: tvSeriesList,
                index: index,
                aspectRatio: aspectRatio,
              );
            },
          );
        }
      },
    );
  }
}
