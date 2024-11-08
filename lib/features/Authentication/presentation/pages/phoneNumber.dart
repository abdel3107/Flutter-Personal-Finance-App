import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ongere/features/Authentication/presentation/bloc/phone_number_bloc/phone_number_bloc.dart';
import 'package:ongere/main.dart';

import '../../../../core/Shared/presentation/widgets/button_bottomBar.dart';

class PhoneNumberVerif extends StatefulWidget {
  const PhoneNumberVerif({super.key});

  @override
  State<PhoneNumberVerif> createState() => _PhoneNumberVerifState();
}

class _PhoneNumberVerifState extends State<PhoneNumberVerif> {

  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isKeyboardOpen = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    // Listen to focus changes to detect when keyboard is active
    _focusNode.addListener(() {
      _isKeyboardOpen.value = _focusNode.hasFocus;
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'CM';
  PhoneNumber number = PhoneNumber(isoCode: 'CM');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
          child: Padding(
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
                      "Verify your phone number with code",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 34,
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.015,),

                    Text(
                      "We'll send you a code. It helps keep your account save",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.025,),

                    Text(
                      "Your Phone number",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.008,),

                    Form(
                      key: formKey,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InternationalPhoneNumberInput(
                              focusNode: _focusNode,
                              onInputChanged: (PhoneNumber number) {

                                setState(() {
                                  this.number = number;
                                });

                              },
                              selectorConfig: SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                useBottomSheetSafeArea: true,
                              ),
                              ignoreBlank: true,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: TextStyle(color: Colors.black),
                              initialValue: number,
                              textFieldController: controller,
                              formatInput: false,
                              keyboardType:
                              TextInputType.numberWithOptions(
                                  signed: true, decimal: true
                              ),
                              inputBorder: OutlineInputBorder(),
                              onSaved: (PhoneNumber number) {
                                setState(() {
                                  this.number = number;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.025,),

                    Row(
                      children: [
                        Text(
                          "Already have an account? ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                              fontSize: 22
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "Sign in ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              color: Color(0xFF3A86FF)
                            ),
                          ),
                        ),
                      ],
                    ),



                  ],
                ),

                ValueListenableBuilder<bool>(
                    valueListenable: _isKeyboardOpen,
                    builder: (context, isKeyboardOpen, child){
                      return AnimatedPadding(
                        duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.only(
                            bottom: isKeyboardOpen ? MediaQuery.of(context).viewInsets.bottom : 20,
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: BlocListener<PhoneNumberBloc, PhoneState>(
                              listener: (context, state) {
                                if (state is PhoneSubmissionSucsessState) {
                                  context.push("/otpPhone");
                                } else if (state is PhoneSubmissionFailureState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Failure to submit number"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              child: ButtonBottombar(
                                text: "Send",
                                onPressed: (){
                                if (formKey.currentState?.validate() ?? false) {
                                formKey.currentState?.save();

                                  final phoneNumber = number.phoneNumber!;

                                  context.read<PhoneNumberBloc>().add(
                                      PhoneNumberSubmissionEvent(phoneNumber)
                                  );

                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Please input correct number")),);
                                  }
                                },
                                color: Color(0xFF3A86FF)
                            ),
),
                          )
                      );
                    }
                )
              ],
            ),
          )
      ),
    );
  }



  @override
  void dispose() {
    _focusNode.dispose();
    controller.dispose();
    _isKeyboardOpen.dispose();
    super.dispose();
  }
}
