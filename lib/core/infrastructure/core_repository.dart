import 'package:dartz/dartz.dart';

import '/core/domain/user.dart';
import '/core/infrastructure/dto/user_dto.dart';
import '/core/infrastructure/remote_service/core_service.dart';
import '/example/domain/character.dart';
import '/example/domain/common_failure.dart';
import '/core/shared/constanst/constants.dart';
import '/example/infrastructure/global_exceptions.dart';
import '/example/infrastructure/remote_service/extensions.dart';
import '/example/infrastructure/remote_service/example_service.dart';

/// Base parameterization repository
class CoreRepository {
  /// Constructor
  CoreRepository(this._coreService);

  ///Example services
  final CoreService _coreService;

  /// Returns a failure or the list of Character
  Future<Either<CommonFailure, User>> register(User user) async {
    try {
      final userDTO = await _coreService.register(UserDTO.fromDomain(user));

      /// returns list of Character
      return right(userDTO.toDomain());
    } on NoInternetConnectionException catch (e) {
      /// returns failure if there was internet connection problem
      return left(CommonFailure.noConnection(message: e.message));
    } on RestApiException catch (e) {
      /// returns failure caused by server exception
      return left(
        CommonFailure.server(
          code: e.errorCode ?? serverErrorCode,
          message: e.errorMessage ?? serverErrorMessage,
        ),
      );
    } on ErrorInRequestException catch (e) {
      /// returns failure if there was error in request
      return left(CommonFailure.data(message: e.message));
    }
  }

  /// Returns a failure or the list of Character
  Future<Either<CommonFailure, User>> login(User user) async {
    try {
      final userDTO = await _coreService.login(UserDTO.fromDomain(user));

      /// returns list of Character
      return right(userDTO.toDomain());
    } on NoInternetConnectionException catch (e) {
      /// returns failure if there was internet connection problem
      return left(CommonFailure.noConnection(message: e.message));
    } on DataNotFoundException catch (e) {
      /// returns failure if there was internet connection problem
      return left(CommonFailure.data(message: e.message));
    } on RestApiException catch (e) {
      /// returns failure caused by server exception
      return left(
        CommonFailure.server(
          code: e.errorCode ?? serverErrorCode,
          message: e.errorMessage ?? serverErrorMessage,
        ),
      );
    } on ErrorInRequestException catch (e) {
      /// returns failure if there was error in request
      return left(CommonFailure.data(message: e.message));
    }
  }

  /// Returns a failure or the list of Character
  Future<Either<CommonFailure, List<Character>>> getCharacters(
      String name) async {
    try {
      final charactersDTO = await _coreService.getCharacters(name);

      /// returns list of Character
      return right(charactersDTO.characterListToDomain());
    } on NoInternetConnectionException catch (e) {
      /// returns failure if there was internet connection problem
      return left(CommonFailure.noConnection(message: e.message));
    } on RestApiException catch (e) {
      /// returns failure caused by server exception
      return left(
        CommonFailure.server(
          code: e.errorCode ?? serverErrorCode,
          message: e.errorMessage ?? serverErrorMessage,
        ),
      );
    } on ErrorInRequestException catch (e) {
      /// returns failure if there was error in request
      return left(CommonFailure.data(message: e.message));
    }
  }
}
