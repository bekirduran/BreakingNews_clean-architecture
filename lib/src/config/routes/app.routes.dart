import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/src/presentation/views/breaking_news_view.dart';

class AppRoutes {

  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(BreakingNewsView());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}