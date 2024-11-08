import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../bloc/phone_number_bloc/phone_number_bloc.dart';
import '../bloc/resendOTPbloc/resend_otp_bloc.dart';

class OtpResend extends StatelessWidget {
  const OtpResend({
    super.key,
    required CountdownController controller,
  }) : _controller = controller;

  final CountdownController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneNumberBloc, PhoneState>(
  builder: (context, phoneState) {
    return BlocBuilder<ResendOtpBloc, bool>(
      builder: (context, state) {
        if(state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Didn't get the code ? ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _controller.restart();
                      context.read<ResendOtpBloc>().add(
                          DesactivateResendOtpEvent()
                      );
                      if(phoneState is PhoneSubmissionSucsessState){
                        context.read<PhoneNumberBloc>().add(
                            PhoneNumberSubmissionEvent(phoneState.phoneNumber));
                      }
                    },
                    child: Text(
                      "Resend it ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0xFF3A86FF)
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled_outlined,
                    color: Color(0xFFE7EAEB),
                  ),
                  SizedBox(width: 5,),
                  Countdown(
                    controller: _controller,
                    seconds: 60,
                    build: (_, double time) => Text(
                      "${time.floor().toString()}s",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    interval: Duration(seconds: 1),
                    onFinished: () {
                      context.read<ResendOtpBloc>().add(
                          ActivateResendOtpEvent()
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        }
        else{
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Didn't get the code ? ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),
                  ),
                  Text(
                    "Resend it ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xFFAFCBFF)
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled_outlined,
                    color: Color(0xFFE7EAEB),
                  ),
                  SizedBox(width: 5,),
                  Countdown(
                    controller: _controller,
                    seconds: 60,
                    build: (_, double time) => Text(
                      "${time.floor().toString()}s",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    interval: Duration(seconds: 1),
                    onFinished: () {
                      context.read<ResendOtpBloc>().add(
                          ActivateResendOtpEvent()
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  },
);
  }
}