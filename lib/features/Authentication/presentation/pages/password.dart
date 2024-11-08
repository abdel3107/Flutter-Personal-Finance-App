import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool passwordVisible=false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
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

                    Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.005,),

                    TextField(
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE7EAEB),
                          ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                                  () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        alignLabelWithHint: false,
                        filled: false,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        fontSize: 20
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
