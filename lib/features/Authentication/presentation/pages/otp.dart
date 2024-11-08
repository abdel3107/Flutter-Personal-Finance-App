import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ongere/features/Authentication/presentation/bloc/confirmOtp/confirm_otp_bloc.dart';
import 'package:ongere/features/Authentication/presentation/bloc/phone_number_bloc/phone_number_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../../../core/Shared/presentation/widgets/button_bottomBar.dart';
import '../widgets/otpInput.dart';
import '../widgets/otpResend.dart';
import '../widgets/smsRetrieverImpl.dart';

class OtpPhone extends StatefulWidget {
  const OtpPhone({super.key});

  @override
  State<OtpPhone> createState() => _OtpPhoneState();
}

class _OtpPhoneState extends State<OtpPhone> {
  final SmsRetriever smsRetriever = SmsRetrieverImpl(
    SmartAuth(),
  );
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isKeyboardOpen = ValueNotifier<bool>(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();
  final CountdownController _controller = CountdownController(autoStart: true);
  bool enableResend = false;


  @override
  void initState() {
    super.initState();
    // Listen to focus changes to detect when keyboard is active
    _focusNode.addListener(() {
      _isKeyboardOpen.value = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color(0xFF3A86FF);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color(0xFFE7EAEB);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        
          child: BlocBuilder<PhoneNumberBloc, PhoneState>(
            builder: (context, state) {
              if (state is PhoneSubmissionSucsessState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.deblur,
                                size: 30,
                                color: Color(0xFFFCD310),
                              ),
                              Text(
                                "Welcome to OnGere",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF3A86FF)
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                          Text(
                            "We just sent an SMS",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 34,
                            ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.015,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Text(
                                  "Enter the security code we sent to ${state.phoneNumber}",
                                  style: TextStyle(
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    context.pop();
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        fontSize: 20,
                                      color: Color(0xFF3A86FF),
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                          OtpInput(
                              formKey: formKey,
                              smsRetriever: smsRetriever,
                              pinController: pinController,
                              focusNode: _focusNode,
                              defaultPinTheme: defaultPinTheme,
                              focusedBorderColor: focusedBorderColor,
                              fillColor: fillColor),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.015,),

                          OtpResend(controller: _controller),


                        ],
                      ),

                      BlocConsumer<ConfirmOtpBloc, ConfirmOtpState>(
                          listener: (context, otpState) {
                            if(otpState is ConfirmOtpSuccess) {
                              context.go("/password");
                            } else if (otpState is ConfirmOtpFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Invalid OTP"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          builder: (BuildContext context, ConfirmOtpState otpState) {
                            if (otpState is ConfirmOtpWaiting) {
                              return ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF3A86FF),
                                      fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)
                                      )
                                  ),
                                  child: CircularProgressIndicator(
                                    color: Color(0xFFFAFAFA),
                                  )
                              );
                            }
                            return ValueListenableBuilder<bool>(
                                valueListenable: _isKeyboardOpen,
                                builder: (context, isKeyboardOpen, child){
                                  return AnimatedPadding(
                                      duration: Duration(milliseconds: 300),
                                      padding: EdgeInsets.only(
                                        bottom: isKeyboardOpen ? MediaQuery.of(context).viewInsets.bottom : 20,
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: ButtonBottombar(
                                            text: "Send",
                                            onPressed: (){
                                              _focusNode.unfocus();
                                              formKey.currentState!.validate();
                                              context.read<ConfirmOtpBloc>().add(
                                                SendConfirmOtpEvent(
                                                  phoneNumber: state.phoneNumber,
                                                  code: pinController.text.toString(),
                                                ),);
                                            },
                                            color: Color(0xFF3A86FF)
                                        ),
                                      )
                                  );
                                }
                            );
                          },

                      )
                    ],
                  ),
                );
              }
              return Center(
                child: Text(
                    "Ooops, they seem to be an error. Please go back and try again",
                  style: TextStyle(
                    color: Colors.red
                  ),
                ),
              );

  },
)
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    pinController.dispose();
    _isKeyboardOpen.dispose();
    super.dispose();
  }
}






