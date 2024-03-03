import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomGenderDropDown extends StatelessWidget {
  final String hint;

  const CustomGenderDropDown({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    String? selectedGender;
    return DropdownButtonFormField<String>(
      icon: SvgPicture.asset('assets/svg/arrow_down.svg'),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
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
      value: selectedGender,
      items: <String>['Мужчина', 'Женщина'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {},
    );
  }
}
