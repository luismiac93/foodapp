import 'package:cleanar_base_app/core/domain/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/example/domain/common_failure.dart';

part 'login_state.freezed.dart';

///Example data state
@freezed
class LoginState with _$LoginState {
  const LoginState._();

  ///Initial: state of Example empty
  const factory LoginState.initial() = _LoginStateInitial;

  ///Loading: state of Example while waiting for information
  const factory LoginState.loading() = _LoginStateLoading;

  ///Data: state of notification when the information arrives
  const factory LoginState.data({required User user}) = _LoginStateData;

  ///Error: state of Example when an error occurs
  const factory LoginState.error(CommonFailure failure) = _LoginStateError;
}
