/// The entry point of the app.
library;

import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dependencies = await AppDependencies.create();
  runApp(MargadarshakApp(dependencies: dependencies));
}
