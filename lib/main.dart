import 'package:app_1_clean/core/navigator/app_routes.dart';
import 'package:app_1_clean/core/navigator/navigator_keys.dart';
import 'package:flutter/material.dart';

import 'core/di_manager/di_manager.dart';
import 'core/navigator/navigator_gen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectionDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      navigatorKey: globalNavigatorKey,
      onGenerateRoute: _onGenerateRoute,
      initialRoute: AppRoutes.home,
    );
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    return RouteGenerator.generateRoute(settings);
  }
}
