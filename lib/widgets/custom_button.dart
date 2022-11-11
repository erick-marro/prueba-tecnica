import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {

  final String text;
  final bool disabled;
  final Function onPressed;

  const CustomButton({
    required this.text,
    required this.disabled,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: ElevatedButton(
        onPressed: () => disabled ? null : onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: disabled ? Colors.grey : Colors.blue
        ), 
        child: Text(
          text
        )),
    );
  }
}