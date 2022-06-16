import 'package:freezed_annotation/freezed_annotation.dart';

import '/example/domain/common_failure.dart';
import '/example/domain/character.dart';

part 'character_state.freezed.dart';

///Example data state
@freezed
class CharacterState with _$CharacterState {
  const CharacterState._();

  ///Initial: state of Example empty
  const factory CharacterState.initial() = _CharacterStateInitial;

  ///Loading: state of Example while waiting for information
  const factory CharacterState.loading() = _CharacterStateLoading;

  ///Data: state of notification when the information arrives
  const factory CharacterState.data({required List<Character> characters}) =
      _CharacterStateData;

  ///Error: state of Example when an error occurs
  const factory CharacterState.error(CommonFailure failure) =
      _CharacterStateError;
}
