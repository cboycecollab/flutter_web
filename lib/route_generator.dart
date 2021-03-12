import 'package:flutter/material.dart';
import 'package:web_app/pages/signed_in.dart';
import 'package:web_app/pages/auth_home.dart';
import 'package:web_app/pages/signed_out.dart';

class RouteGenerator {
  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/auth_home':
        return MaterialPageRoute(
          builder: (context) => AuthHome(),
        );
      case '/signed_in':
        return MaterialPageRoute(
          builder: (context) => SignedIn(),
        );
      case '/signed_out':
        return MaterialPageRoute(
          builder: (context) => SignedOut(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<MaterialPageRoute> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),
          body: Center(
            child: Text('NO VALID ROUTE FOUND'),
          ),
        );
      },
    );
  }
}
