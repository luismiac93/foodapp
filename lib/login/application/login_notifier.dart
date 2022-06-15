import 'package:cleanar_base_app/login/application/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/example/infrastructure/example_repository.dart';
import '/example/application/example_state.dart';

///Example notifier
class LoginNotifier extends StateNotifier<LoginState> {
  /// Constructor
  LoginNotifier({required this.exampleRepository})
      : super(const LoginState.initial());

  ///Repository Example
  final ExampleRepository exampleRepository;

  ///Get list of the Character
  Future<void> getExample() async {
    state = const LoginState.loading();

    ///Get all Example to the user country
    final result = await exampleRepository.getCharacters();

    state = result.fold(
      (error) => LoginState.error(error),
      (characters) => LoginState.data(characters: characters),
    );
  }
}
