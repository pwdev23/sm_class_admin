import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final supabase = Supabase.instance.client;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.logIn)),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    label: Text(l10n.email),
                    hintText: 'tony@example.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(label: Text(l10n.password)),
                  obscureText: true,
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _onLogIn,
                    child: Text(l10n.logIn),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onLogIn() async {
    final msg = ScaffoldMessenger.of(context);
    final nav = Navigator.of(context);

    try {
      var res = await supabase.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final User? user = res.user;

      if (user != null) nav.pushReplacementNamed('/home');
    } catch (e) {
      e as AuthApiException;
      var text = e.message[0].toUpperCase() + e.message.substring(1);
      msg.showSnackBar(SnackBar(content: Text(text)));
      throw Exception(e);
    }
  }
}
