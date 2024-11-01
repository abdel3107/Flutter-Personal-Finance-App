import 'package:flutter/material.dart';
import 'package:ongere/core/di/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/Shared/universalVariables.dart';
import 'core/router/app_router.dart';
import 'features/Onboarding/OnboardingService.dart';

Future<void> main() async {
  setupInjector();
  WidgetsFlutterBinding.ensureInitialized();
  final isOnboardingCompleted = await OnboardingService.isOnboardingCompleted();
  isOnboardingDone = isOnboardingCompleted;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
      // routerDelegate: router.routerDelegate,
      // routeInformationParser: router.routeInformationParser,
      // routeInformationProvider: router.routeInformationProvider,
    );
  }
}