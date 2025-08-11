import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final supabase = Supabase.instance.client;
    final User? user = supabase.auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          TextButton(
            onPressed: () => _onLogOut(context),
            child: Text(l10n.logOut),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${l10n.email}: ${user!.email!}'),
            Text('Role: ${user.role!}'),
          ],
        ),
      ),
    );
  }

  Future<void> _onLogOut(BuildContext context) async {
    final nav = Navigator.of(context);
    final supabase = Supabase.instance.client;
    await supabase.auth.signOut();
    nav.pushNamed('/');
  }
}
