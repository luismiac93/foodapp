import 'package:auto_route/annotations.dart';

import '/example/presentation/example_page.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: ExamplePage, initial: true),
  ],
)
class $AppRouter {}
