import 'package:flutter/material.dart';

class PasswordValidationWidget extends StatefulWidget {
  @override
  _PasswordValidationWidgetState createState() =>
      _PasswordValidationWidgetState();
}

class _PasswordValidationWidgetState extends State<PasswordValidationWidget> {
  late TextEditingController _passwordController;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasDigits = false;
  bool hasSpecialCharacters = false;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onPasswordChanged() {
    final password = _passwordController.text;
    setState(() {
      hasUppercase = password.contains(RegExp(r'[A-Z]'));
      hasLowercase = password.contains(RegExp(r'[a-z]'));
      hasDigits = password.contains(RegExp(r'\d'));
      hasSpecialCharacters =
          password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            hintText: 'Пароль',
            hintStyle: TextStyle(
              color: Color.fromRGBO(206, 206, 206, 1),
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              borderSide: BorderSide(
                color: Color.fromRGBO(206, 206, 206, 1),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              borderSide: BorderSide(
                  color: Color.fromRGBO(153, 191, 212, 1), width: 1.0),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          obscureText: true,
        ),
        const SizedBox(height: 6),
        _buildValidationText(
            '✓ Заглавные латинские буквы: от A до Z', hasUppercase),
        _buildValidationText(
            '✓ Строчные латинские буквы: от a до z', hasLowercase),
        _buildValidationText('✓ Цифры от 0 до 9', hasDigits),
        _buildValidationText(
            '✓ Символы: !@#%^&*(),.?":{}|<>', hasSpecialCharacters),
      ],
    );
  }

  Widget _buildValidationText(String text, bool isValid) {
    return Row(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: TextStyle(
                color: isValid ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
