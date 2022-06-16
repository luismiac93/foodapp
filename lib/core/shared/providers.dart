import 'package:cleanar_base_app/core/infrastructure/core_repository.dart';
import 'package:cleanar_base_app/core/infrastructure/remote_service/core_service.dart';
import 'package:cleanar_base_app/home/appplication/character_notifier.dart';
import 'package:cleanar_base_app/home/appplication/character_state.dart';
import 'package:cleanar_base_app/login/application/login_notifier.dart';
import 'package:cleanar_base_app/login/application/login_state.dart';
import 'package:cleanar_base_app/main.dart';
import 'package:cleanar_base_app/register/application/register_notifier.dart';
import 'package:cleanar_base_app/register/application/register_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Dio Service Dependency Injection
final dioProvider = Provider((ref) => Dio());

/// Repository of core Service
final coreServiceProvider = Provider(
  (ref) => CoreService(
    ref.watch(dioProvider),
    ref.watch(appConfigProvider.state).state,
  ),
);

/// Repository of core Repository
final coreRepositoryProvider = Provider(
  (ref) => CoreRepository(ref.watch(coreServiceProvider)),
);

///register notifier provider
final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(
    coreRepository: ref.watch(coreRepositoryProvider),
  ),
);

///login notifier provider
final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(
    coreRepository: ref.watch(coreRepositoryProvider),
  ),
);

///login notifier provider
final characterNotifierProvider =
    StateNotifierProvider<CharacterNotifier, CharacterState>(
  (ref) => CharacterNotifier(
    coreRepository: ref.watch(coreRepositoryProvider),
  ),
);
