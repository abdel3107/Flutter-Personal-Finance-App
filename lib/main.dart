import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ongere/core/di/injector.dart';
import 'package:ongere/features/Authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:ongere/features/Authentication/presentation/bloc/confirmOtp/confirm_otp_bloc.dart';
import 'package:ongere/features/Authentication/presentation/bloc/createPassword/create_password_bloc.dart';
import 'package:ongere/features/Authentication/presentation/bloc/phone_number_bloc/phone_number_bloc.dart';
import 'package:ongere/features/Authentication/presentation/bloc/resendOTPbloc/resend_otp_bloc.dart';
import 'package:ongere/features/Authentication/presentation/bloc/signin/signin_bloc.dart';
import 'package:ongere/features/Authentication/presentation/bloc/signup/signup_bloc.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/Shared/universalVariables.dart';
import 'core/router/app_router.dart';
import 'features/Onboarding/OnboardingService.dart';

Future<void> main() async {
  setupInjector();
  WidgetsFlutterBinding.ensureInitialized();
  final isOnboardingCompleted = await OnboardingService.isOnboardingCompleted();
  isOnboardingDone = isOnboardingCompleted;
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc(),),
          BlocProvider<PhoneNumberBloc>(create: (context) => PhoneNumberBloc()),
          BlocProvider<ResendOtpBloc>(create: (context) => ResendOtpBloc()),
          BlocProvider<ConfirmOtpBloc>(create: (context) => ConfirmOtpBloc()),
          BlocProvider<CreatePasswordBloc>(create: (context) => CreatePasswordBloc()),
          BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
          BlocProvider<SigninBloc>(create: (context) => SigninBloc()),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   routerConfig: router,
    //   theme: ThemeData(
    //     fontFamily: 'Poppins',
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    // );
    context.read<AuthBloc>().add(AppStartEvent());
    return AppRouter();
  }
}