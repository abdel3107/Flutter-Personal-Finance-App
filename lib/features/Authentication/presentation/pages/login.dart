import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ongere/core/router/app_router.dart';
import 'package:ongere/features/Authentication/data/models/signin_request_params.dart';
import 'package:ongere/features/Authentication/presentation/bloc/phone_number_bloc/phone_number_bloc.dart';
import 'package:ongere/features/Authentication/presentation/bloc/signup/signup_bloc.dart';

import '../../../../core/Shared/presentation/widgets/button_bottomBar.dart';
import '../bloc/signin/signin_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isKeyboardOpen = ValueNotifier<bool>(false);
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String initialCountry = 'CM';
  PhoneNumber number = PhoneNumber(isoCode: 'CM');
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must include an uppercase letter";
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Password must include a lowercase letter";
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must include a digit";
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Password must include a special character";
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible=true;
    confirmPasswordVisible = false;
    _focusNode.addListener(() {
      _isKeyboardOpen.value = _focusNode.hasFocus;
    });
  }
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
                ListView(
                  children: [
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

                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 34,
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                    Text(
                      "Phone number",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                    Form(
                      key: _formKey1,
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
                              textFieldController: _phoneController,
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

                    SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                    Form(
                      key: _formKey2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                          // Password field
                          TextFormField(
                            controller: _passwordController,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xFFE7EAEB), // Border color when not focused
                                  width: 1.5,
                                ),
                              ),
                              // Border when the field is focused
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE7EAEB), // Border color when focused
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // Border when there's an error
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red, // Border color when there's an error
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // Border when the field is focused and there's an error
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent, // Border color when focused with error
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            validator: validatePassword,
                            style: TextStyle(fontSize: 18),
                            onChanged: (input){
                              _formKey1.currentState!.validate();
                            },
                          ),
                          SizedBox(height: 15),

                        ],
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                    BlocConsumer<SigninBloc, SigninState>(
                        listener: (context, signinState) {
                          if(signinState is SigninSuccess) {
                            context.go("/home");
                          } else if (signinState is SigninFailed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Error signing in"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        builder: (context, signupState) {
                          if (signupState is SignupWaitingState){
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
                                bottom: isKeyboardOpen ? MediaQuery.of(context).viewInsets.bottom : 5,
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: ButtonBottombar(
                                    text: "Sign in",
                                    onPressed: (){
                                      _focusNode.unfocus();
                                      final phoneNumber = number.phoneNumber!;
                                      final password = _passwordController.text;
                                      SigninRequestParams params = SigninRequestParams(
                                          phoneNumber: phoneNumber,
                                          password: password
                                      );
                                      if (_formKey1.currentState!.validate() && _formKey2.currentState!.validate()) {
                                        context.read<SigninBloc>().add(
                                          LoginEvent(
                                              params: params
                                          )
                                        );

                                      }
                                    },
                                    color: Color(0xFF3A86FF)
                                ),
                              )
                          );
                        }
                    );
                        },
                      ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                    Center(
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont have an account?  ",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              context.push("/phoneNumber");
                            },
                            child: Text(
                              "Create account",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Color(0xFF3A86FF)
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),


              ],
            ),
          ),
        )
    );
  }
}
