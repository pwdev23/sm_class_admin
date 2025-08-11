import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/';

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    _onMockAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(child: CircularProgressIndicator.adaptive()),
    );
  }

  Future<void> _onMockAuth() async {
    final nav = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 2));
    nav.pushNamedAndRemoveUntil('/home', (_) => false);
  }
}
