import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/';

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _onAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(child: CircularProgressIndicator.adaptive()),
    );
  }

  // Future<void> _onMockAuth() async {
  //   final nav = Navigator.of(context);
  //   await Future.delayed(const Duration(seconds: 2));
  //   nav.pushNamedAndRemoveUntil('/login', (_) => false);
  // }

  Future<void> _onAuth() async {
    final nav = Navigator.of(context);

    final User? user = supabase.auth.currentUser;

    await Future.delayed(const Duration(seconds: 2));

    if (user == null) {
      nav.pushNamedAndRemoveUntil('/login', (_) => false);
    } else {
      nav.pushNamedAndRemoveUntil('/home', (_) => false);
    }
  }
}
