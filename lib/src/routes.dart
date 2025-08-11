import 'package:flutter/material.dart';

import 'routes/pages.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const AuthPage());
    case '/home':
      return MaterialPageRoute(builder: (_) => const HomePage());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginPage());
    default:
      return MaterialPageRoute(
        builder: (_) => UndefinedRoutePage(routeName: settings.name!),
      );
  }
}
