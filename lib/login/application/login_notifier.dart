import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/domain/user.dart';
import '/core/infrastructure/core_repository.dart';
import '/login/application/login_state.dart';

///Login notifier
class LoginNotifier extends StateNotifier<LoginState> {
  /// Constructor
  LoginNotifier({required this.coreRepository})
      : super(const LoginState.initial());

  ///Repository core
  final CoreRepository coreRepository;

  ///Get list of the Character
  Future<void> login(User user) async {
    state = const LoginState.loading();

    ///Get all core to the user country
    final result = await coreRepository.login(user);

    state = result.fold(
      (error) => LoginState.error(error),
      (user) => LoginState.data(user: user),
    );
  }
}
