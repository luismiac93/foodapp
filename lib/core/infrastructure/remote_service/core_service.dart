import 'dart:convert';

import 'package:cleanar_base_app/example/infrastructure/dtos/character_dto.dart';
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

  /// Method of calling the list of character
  Future<List<CharacterDTO>> getCharacters(String name) async {
    try {
      //TODO: implement search by name
      final requestUri = Uri.https(
        _appConfig.baseUrl,
        '/api/character',
      );

      final response = await _dio.getUri(requestUri);

      if (response.statusCode == 200) {
        final result = response.data['results'];

        final characterList = <CharacterDTO>[];

        for (final item in result) {
          characterList.add(CharacterDTO.fromJson(item));
        }

        /// return character list
        return characterList;
      } else {
        /// Throws Exception when status code is not 200
        throw RestApiException(
          errorCode: response.statusCode,
          errorMessage: response.statusMessage,
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
