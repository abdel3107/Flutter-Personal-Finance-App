import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ongere/core/Shared/presentation/pages/Home.dart';
import 'package:ongere/features/Authentication/presentation/pages/login.dart';
import 'package:ongere/features/Authentication/presentation/pages/otp.dart';
import 'package:ongere/features/Authentication/presentation/pages/password.dart';
import 'package:ongere/features/Authentication/presentation/pages/phoneNumber.dart';
import 'package:ongere/features/Authentication/presentation/pages/useerInfo.dart';
import 'package:ongere/features/Onboarding/presentation/pages/onboarding1.dart';
import 'package:ongere/features/Onboarding/presentation/pages/onboarding2.dart';
import 'package:ongere/features/Onboarding/presentation/pages/onboarding3.dart';

import '../../features/Authentication/presentation/bloc/auth/auth_bloc.dart';
import '../Shared/universalVariables.dart';



class AppRouter extends StatelessWidget {

      const AppRouter({super.key});

      @override
      Widget build(BuildContext context) {
            return BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                        bool isLoggedIn = false;
                        if(state is Authenticated){
                              isLoggedIn = true;
                        }
                        return MaterialApp.router(
                              routerConfig: GoRouter(
                                    initialLocation: isOnboardingDone
                                        ? (isLoggedIn ? '/home' : '/login')
                                        : '/onboarding1',
                                    routes: [
                                          GoRoute(
                                                path: "/onboarding1",
                                                builder: (context, state) => Onboarding1(),
                                          ),
                                          GoRoute(
                                                path: "/onboarding2",
                                                builder: (context, state) => Onboarding2(),
                                          ),
                                          GoRoute(
                                                path: "/onboarding3",
                                                builder: (context, state) => Onboarding3(),
                                          ),
                                          GoRoute(
                                                path: "/login",
                                                builder: (context, state) => LoginPage(),
                                          ),
                                          GoRoute(
                                                path: "/phoneNumber",
                                                builder: (context, state) => PhoneNumberVerif(),
                                          ),
                                          GoRoute(
                                                path: "/otpPhone",
                                                builder: (context, state) => OtpPhone(),
                                          ),
                                          GoRoute(
                                                path: "/password",
                                                builder: (context, state) => Password(),
                                          ),
                                          GoRoute(
                                                path: "/createUserInfo",
                                                builder: (context, state) => UserInfo(),
                                          ),
                                          GoRoute(
                                                path: "/home",
                                                builder: (context, state) => Home(),
                                          ),
                                    ],
                              ),
                              theme: ThemeData(
                                    fontFamily: 'Poppins',
                                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                                    useMaterial3: true,
                              ),
                        );
                  },
            );
      }
}





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
      ),GoRoute(
          path: "/password",
          builder: (context, state) => Password()
      ),GoRoute(
          path: "/createUserInfo",
          builder: (context, state) => UserInfo()
      ),GoRoute(
          path: "/home",
          builder: (context, state) => Home()
      ),

    ]
);