import 'package:movie_app_test_getx/core/base/index.dart';

class BaseRepository<P extends BaseProvider> {
  BaseRepository({
    required this.provider,
  });

  final P provider;
}
