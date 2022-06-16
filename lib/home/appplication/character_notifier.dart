import 'package:cleanar_base_app/core/infrastructure/core_repository.dart';
import 'package:cleanar_base_app/home/appplication/character_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/example/infrastructure/example_repository.dart';

import '/example/application/example_state.dart';

///Example notifier
class CharacterNotifier extends StateNotifier<CharacterState> {
  /// Constructor
  CharacterNotifier({required this.coreRepository})
      : super(const CharacterState.initial());

  ///Repository Example
  final CoreRepository coreRepository;

  ///Get list of the Character
  Future<void> getCharacters(String name) async {
    state = const CharacterState.loading();

    ///Get all Example to the user country
    final result = await coreRepository.getCharacters(name);

    state = result.fold(
      (error) => CharacterState.error(error),
      (characters) => CharacterState.data(characters: characters),
    );
  }
}
