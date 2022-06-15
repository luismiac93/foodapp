import 'package:auto_route/annotations.dart';

import '/login/presentation/login_page.dart';
import '/home/presentation/home_page.dart';
import '/register/presentation/register_page.dart';
import '/example/presentation/example_page.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: ExamplePage, initial: true),
    AutoRoute(page: LoginPage, initial: true, path: 'login'),
    AutoRoute(page: RegisterPage, path: 'register'),
    AutoRoute(page: HomePage, path: 'home'),
  ],
)
class $AppRouter {}
