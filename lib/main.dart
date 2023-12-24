import 'package:aniku/common/style.dart';
import 'package:aniku/core/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "AnimeKu",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: ColorApp.primary, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: ColorApp.primary, brightness: Brightness.dark),
        textTheme: myTextTheme,
        useMaterial3: true, 
      ),
      routeInformationParser: AppRoutes.goRouter.routeInformationParser,
      routeInformationProvider: AppRoutes.goRouter.routeInformationProvider,
      routerDelegate: AppRoutes.goRouter.routerDelegate,
    );
  }
}
