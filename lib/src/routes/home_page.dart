import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(appBar: AppBar(title: Text(l10n.appTitle)));
  }
}
