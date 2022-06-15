import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/domain/user.dart';
import '/example/domain/common_failure.dart';

part 'register_state.freezed.dart';

///Example data state
@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  ///Initial: state of Example empty
  const factory RegisterState.initial() = _RegisterStateInitial;

  ///Loading: state of Example while waiting for information
  const factory RegisterState.loading() = _RegisterStateLoading;

  ///Data: state of notification when the information arrives
  const factory RegisterState.data({required User user}) = _RegisterStateData;

  ///Error: state of Example when an error occurs
  const factory RegisterState.error(CommonFailure failure) =
      _RegisterStateError;
}
