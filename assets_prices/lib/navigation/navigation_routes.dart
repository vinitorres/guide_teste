import 'package:assets_prices/modules/asset_details/asset_details_page.dart';
import 'package:flutter/material.dart';

import 'navigation_router.dart';

class NavigationRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoutes.assetDetails:
        return MaterialPageRoute(builder: (_) => AssetDetailsPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('Error')),
                ));
    }
  }
}
