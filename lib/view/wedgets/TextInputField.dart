import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loop/constants.dart';

class Textinputfield extends StatelessWidget {
  final bool isPass;
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  const Textinputfield({super.key, required this.controller, required this.labelText, required this.icon,this.isPass = false });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller ,
      decoration: InputDecoration(
        labelText: labelText ,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: kTextColorSecondary,
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: kTextColorSecondary,
            )
        ),

      ),
      obscureText: isPass,


    );
  }
}
