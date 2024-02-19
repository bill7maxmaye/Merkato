import 'package:flutter/material.dart';
import 'package:merkato/constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text,
          style: TextStyle(
            color: Colors.white,
          )),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        //added background
        backgroundColor: GlobalVariables.secondaryColor,
      ),
    );
  }
}
