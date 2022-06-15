import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/shared/app_config.dart';
import '/core/shared/constanst/constants.dart';
import '/core/presentation/routes/router.gr.dart';

/// App Config Provider
late StateProvider<AppConfig> appConfigProvider;

void main() {
  appConfigProvider =
      StateProvider<AppConfig>((ref) => AppConfig(dev, devBaseUrl));
  runApp(ProviderScope(
    child: AppBase(),
  ));
}

///App base config
class AppBase extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Clean Architecture Base App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
