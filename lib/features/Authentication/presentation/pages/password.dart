import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ongere/core/router/app_router.dart';

import '../../../../core/Shared/presentation/widgets/button_bottomBar.dart';
import '../bloc/createPassword/create_password_bloc.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isKeyboardOpen = ValueNotifier<bool>(false);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != _passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  @override
  void initState(){
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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

                    SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                    Text(
                      "Create new password",
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

                    Form(
                      key: _formKey2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Confirm Password",
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height * 0.005,),

                            // Confirm Password field
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: confirmPasswordVisible,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(confirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      confirmPasswordVisible = !confirmPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              validator: validateConfirmPassword,
                              style: TextStyle(fontSize: 18),
                              onChanged: (input){
                                _formKey2.currentState!.validate();
                              },
                            ),
                            SizedBox(height: 30),
                          ],
                        )
                    ),

                  ],
                ),


                BlocConsumer<CreatePasswordBloc, CreatePasswordState>(
                    listener: (context, state) {
                      if(state is CreatePasswordSuccess){
                        context.push("/createUserInfo");
                      }
                      else if(state is CreatePasswordFailure){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error in creating password"))
                        );
                      }
                    },
                    builder: (context, state) {
                      return ValueListenableBuilder<bool>(
                    valueListenable: _isKeyboardOpen,
                    builder: (context, isKeyboardOpen, child){
                      if (state is CreatePasswordWaiting){
                        return AnimatedPadding(
                            duration: Duration(milliseconds: 300),
                            padding: EdgeInsets.only(
                              bottom: isKeyboardOpen ? MediaQuery.of(context).viewInsets.bottom : 20,
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
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
                              ),
                            ),
                        );
                      }
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
                                  _formKey1.currentState!.validate();
                                  _formKey2.currentState!.validate();
                                  context.read<CreatePasswordBloc>().add(
                                      SubmitPasswordEvent(password: _passwordController.text)
                                  );
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
