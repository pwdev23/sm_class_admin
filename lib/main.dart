import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'environments.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: kProjectUrl, anonKey: kApiKey);

  runApp(const App());
}
