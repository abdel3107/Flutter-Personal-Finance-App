import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ongere/features/Authentication/presentation/bloc/phone_number_bloc/phone_number_bloc.dart';

class OtpPhone extends StatelessWidget {
  const OtpPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhoneNumberBloc, PhoneState>(
          builder: (context, state) {
            if (state is PhoneNumberState) {
              print(state.phoneNumber);
              return Center(
                child: Text(state.phoneNumber),
              );
            }
            return Center(
              child: Text("Nothing"),
            );
          }
      ),
    );
  }
}
