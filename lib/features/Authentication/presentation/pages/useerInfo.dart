import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ongere/core/router/app_router.dart';
import 'package:ongere/features/Authentication/data/models/signup_request_params.dart';
import 'package:ongere/features/Authentication/presentation/bloc/createPassword/create_password_bloc.dart';
import 'package:ongere/features/Authentication/presentation/bloc/signup/signup_bloc.dart';

import '../../../../core/Shared/presentation/widgets/button_bottomBar.dart';
import '../bloc/phone_number_bloc/phone_number_bloc.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isKeyboardOpen = ValueNotifier<bool>(false);
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

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
                      "Lastly, tell us more about you",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 34,
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                    Form(
                      key: _formKey1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First Name Field
                          Text(
                            "First Name",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                          TextFormField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xFFE7EAEB), // Border color when not focused
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE7EAEB), // Border color when focused
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red, // Border color when there's an error
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent, // Border color when focused with error
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 18),
                            onChanged: (input) {
                              _formKey1.currentState!.validate();
                            },
                          ),
                          SizedBox(height: 15),

                          // Last Name Field
                          Text(
                            "Last Name",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                          TextFormField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xFFE7EAEB), // Border color when not focused
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE7EAEB), // Border color when focused
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red, // Border color when there's an error
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent, // Border color when focused with error
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 18),
                            onChanged: (input) {
                              _formKey1.currentState!.validate();
                            },
                          ),
                          SizedBox(height: 20),

                        ],

                      ),


                    ),

                  ],
                ),

                BlocConsumer<SignupBloc, SignupState>(
                    listener: (context, signupState) {
                      if(signupState is SignupSuccessState) {
                        context.go("/home");
                      } else if (signupState is SignupFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Error while creating account"),
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
                                    text: "Send",
                                    onPressed: (){
                                      _focusNode.unfocus();
                                      String phoneNumber = "";
                                      String password = "";
                                      var  phoneState = context.read<PhoneNumberBloc>().state;
                                      var passwordState = context.read<CreatePasswordBloc>().state;
                                      if (phoneState is PhoneSubmissionSucsessState) {
                                        phoneNumber = phoneState.phoneNumber ;
                                      }
                                      if (passwordState is CreatePasswordSuccess) {
                                        password = passwordState.password;
                                      }
                                      if (_formKey1.currentState!.validate() && phoneNumber.isNotEmpty && password.isNotEmpty) {
                                        SignupRequestParams params = SignupRequestParams(
                                            firstName: _firstNameController.text,
                                            lastName: _lastNameController.text,
                                            phoneNumber: phoneNumber,
                                            password: password
                                        );
                                        context.read<SignupBloc>().add(
                                          RegisterEvent(params: params)
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

              ],
            ),
          ),
        )
    );
  }
}
