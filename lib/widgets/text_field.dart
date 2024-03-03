import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChange;
  final TextInputType textType;
  final TextEditingController? controller;
  final bool obscureText;

  const AppTextField({
    super.key,
    required this.hint,
    this.onChange,
    required this.textType,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return TextField(
      focusNode: myFocusNode,
      keyboardType: textType,
      onChanged: onChange,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: '$hint',
        hintStyle: TextStyle(
          color: Color.fromRGBO(206, 206, 206, 1),
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide(
            color: Color.fromRGBO(206, 206, 206, 1),
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide:
              BorderSide(color: Color.fromRGBO(153, 191, 212, 1), width: 1.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
