import 'package:flutter/material.dart';
import 'package:web_app/pages/signed_in.dart';
import 'package:web_app/pages/signed_out.dart';
import 'package:web_app/widgets/auth_widget.dart';

class AuthHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthWidget(
        routeCallback: (bool authenticated) {
          print('User is authenticated: $authenticated');
        },
        signedInBuilder: (context) => SignedIn(),
        signedOutBuilder: (context) => SignedOut());
  }
}
