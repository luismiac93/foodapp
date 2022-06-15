import 'dart:io';

import 'package:dio/dio.dart';

/// Dio Error Extension
extension DioErrorX on DioError {
  /// Check if there is internet connection
  bool get isNoConnectionError {
    return type == DioErrorType.other && error is SocketException;
  }
}
