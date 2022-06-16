import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/infrastructure/dto/user_dto.dart';
import '/core/shared/app_config.dart';
import '/core/shared/constanst/constants.dart';
import '/example/infrastructure/dio_extension.dart';
import '/example/infrastructure/global_exceptions.dart';

/// Method service called throughout the application
class CoreService {
  /// Default Constructor
  CoreService(this._dio, this._appConfig);

  final Dio _dio;
  final AppConfig _appConfig;

  /// Method of calling the list of character
  Future<UserDTO> register(UserDTO user) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final userText = jsonEncode(user);

      await prefs.setString('user', userText);

      return UserDTO(
          name: user.name, email: user.email, password: user.password);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        /// Throws exception caused by internet connection problem
        throw const NoInternetConnectionException(noInternetConnectionMessage);
      } else if (e.response != null) {
        /// Throws Exception when something went wrong in the call
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage,
        );
      } else {
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: dioErrorMessage,
        );
      }
    }
  }

  /// Method of calling the list of character
  Future<UserDTO> login(UserDTO user) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final String? userString = prefs.getString('user');
      if (userString != null) {
        final userJson = jsonDecode(userString);
        final userDTO = UserDTO.fromJson(userJson);
        if (userDTO.email == user.email && userDTO.password == user.password) {
          return userDTO;
        } else {
          /// the method does not return a message
          throw const DataNotFoundException(
            'Error usuario no encontrado',
          );
        }
      } else {
        /// the method does not return a message
        throw const DataNotFoundException(
          'Error usuario no encontrado',
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        /// Throws exception caused by internet connection problem
        throw const NoInternetConnectionException(noInternetConnectionMessage);
      } else if (e.response != null) {
        /// Throws Exception when something went wrong in the call
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage,
        );
      } else {
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: dioErrorMessage,
        );
      }
    }
  }
}
