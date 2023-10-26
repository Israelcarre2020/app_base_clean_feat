import 'package:app_1_clean/core/navigator/app_routes.dart';
import 'package:app_1_clean/features/feat_one/presentation/pages/page2.dart';
import 'package:flutter/material.dart';

import '../../features/feat_one/domain/entities/data_test_entity.dart';
import '../../features/feat_one/presentation/pages/home_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    final availableRoutes = getAvailableRoutes(args);
    final page = availableRoutes[settings.name]!;

    return MaterialPageRoute(builder: page, settings: settings);
  }

  static Map<String, WidgetBuilder> getAvailableRoutes(Map? args) {
    return {
      AppRoutes.home: (context) => const HomePage(),
      AppRoutes.page2: (context) =>
          Page2(dataTestEntity: args!['dataTestEntity'] as DataTestEntity),
    };
  }
}
