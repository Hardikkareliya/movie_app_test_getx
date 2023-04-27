import "package:dio/dio.dart";

class GlobalVariables {
  static _App app = _App();
}

class _App {
  late Dio client;
  bool restartRequired = false;
}
