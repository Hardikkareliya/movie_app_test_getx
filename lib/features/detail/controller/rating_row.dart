import 'package:movie_app_test_getx/core/base/index.dart';
import 'package:movie_app_test_getx/features/detail/index.dart';
import 'package:get/get.dart';

class RatingRowController extends BaseRepositoryController<DetailRepository, DetailProvider, dynamic> {
  RatingRowController({
    required this.detailRepository,
  }) : super(repository: detailRepository);

  final DetailRepository detailRepository;

  final RxBool isRated = false.obs;
  final RxBool isRatedApi = false.obs;
  final RxDouble rate = 0.0.obs;
}
