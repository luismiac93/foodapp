import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/domain/user.dart';
import '/core/infrastructure/core_repository.dart';
import '/register/application/register_state.dart';

///Example notifier
class RegisterNotifier extends StateNotifier<RegisterState> {
  /// Constructor
  RegisterNotifier({required this.coreRepository})
      : super(const RegisterState.initial());

  ///Repository Core
  final CoreRepository coreRepository;

  ///Get list of the Character
  Future<void> register(User user) async {
    state = const RegisterState.loading();

    ///Get all Example to the user country
    final result = await coreRepository.register(user);

    state = result.fold(
      (error) => RegisterState.error(error),
      (user) => RegisterState.data(user: user),
    );
  }
}
