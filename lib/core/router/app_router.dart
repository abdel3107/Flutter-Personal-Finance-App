
import 'package:go_router/go_router.dart';
import 'package:ongere/features/Authentication/presentation/pages/login.dart';
import 'package:ongere/features/Authentication/presentation/pages/otp.dart';
import 'package:ongere/features/Authentication/presentation/pages/phoneNumber.dart';
import 'package:ongere/features/Onboarding/presentation/pages/onboarding1.dart';
import 'package:ongere/features/Onboarding/presentation/pages/onboarding2.dart';
import 'package:ongere/features/Onboarding/presentation/pages/onboarding3.dart';

import '../Shared/universalVariables.dart';


final GoRouter router = GoRouter(
    initialLocation:  isOnboardingDone ? "/phoneNumber" : "/onboarding1",
routes: [
      GoRoute(
        path: "/onboarding1",
        builder: (context, state) => Onboarding1()
      ),
      GoRoute(
          path: "/onboarding2",
          builder: (context, state) => Onboarding2()
      ),GoRoute(
          path: "/onboarding3",
          builder: (context, state) => Onboarding3()
      ),GoRoute(
          path: "/login",
          builder: (context, state) => LoginPage()
      ),GoRoute(
          path: "/phoneNumber",
          builder: (context, state) => PhoneNumberVerif()
      ),GoRoute(
          path: "/otpPhone",
          builder: (context, state) => OtpPhone()
      ),

    ]
);