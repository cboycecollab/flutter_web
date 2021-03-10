import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_app/providers/firebase_providers.dart';

class AuthWidget extends ConsumerWidget {
  AuthWidget({required this.signedInBuilder, required this.signedOutBuilder});
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder signedOutBuilder;

  @override
  Widget build(BuildContext context, watch) {
    final authStateChanges = watch(authStateChangesProvider);
    return authStateChanges.when(
      data: (user) => _data(context, user),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, __) {
        print(err);
        return Scaffold(
          body: EmptyContent(
            title: 'Something went wrong',
            message: 'Can\'t load data right now.',
          ),
        );
      },
    );
  }

  Widget _data(BuildContext context, User? user) {
    if (user != null) {
      return signedInBuilder(context);
    }

    return signedOutBuilder(context);
  }
}

class EmptyContent extends StatelessWidget {
  final String? title;
  final String? message;
  EmptyContent({this.message, this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title ?? 'Default title'),
          Text(message ?? 'Default message')
        ],
      ),
    );
  }
}
