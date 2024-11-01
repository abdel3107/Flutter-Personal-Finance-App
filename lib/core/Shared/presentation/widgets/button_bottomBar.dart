import 'package:flutter/material.dart';

class ButtonBottombar extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final Color color;


  const ButtonBottombar({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          )
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Color(0xFFFAFAFA),
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
