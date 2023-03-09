import 'package:flutter/material.dart';
import 'injection/dependency_injection.dart';
import 'navigation/navigation_router.dart';
import 'navigation/navigation_routes.dart';

Future<void> main() async {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assets Prices',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: NavigationRoutes.initialRoute,
      navigatorKey: NavigationRouter.navigatorKey,
      onGenerateRoute: NavigationRouter.generateRoute,
    );
  }
}
