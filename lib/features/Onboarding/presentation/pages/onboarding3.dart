import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ongere/core/Shared/presentation/widgets/button_bottomBar.dart';
import 'package:ongere/core/router/app_router.dart';

import '../../OnboardingService.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
          Image(image: AssetImage("assets/images/onBoarding/onboarding3.png")),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.horizontal_rule_rounded,
                weight: 100,
                size: 50,
                color: Color(0XFFD0D0D0),
              ),Icon(
                Icons.horizontal_rule_rounded,
                weight: 100,
                size: 50,
                color: Color(0XFFD0D0D0),
              ),Icon(
                Icons.horizontal_rule_rounded,
                weight: 100,
                size: 50,
                color: Color(0XFF3A86FF),
              ),
            ],

          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Text(
              "Your data is safe with us",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 34
              ),
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

          ButtonBottombar(
              text: "Get Started",
              onPressed: () async {
                await OnboardingService.setOnboardingCompleted();
                context.go("/login");
              },
              color: Color(0xFF3A86FF)
          )


        ],
      ),
    );
  }
}
