import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AuthTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextInputType type;
  bool obscure;
  final TextEditingController controller;
  String? errorText;
  List<TextInputFormatter>? inputFormatter;

  Widget? suffixIcon;
  AuthTextField(
      {super.key,
      this.errorText,
      this.inputFormatter,
      required this.icon,
      this.suffixIcon,
      required this.label,
      required this.type,
      this.obscure = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.019),
        color: Colors.black12,
      ),
      child: TextFormField(
        inputFormatters: inputFormatter,
        controller: controller,
        obscureText: obscure,
        keyboardType: type,
        decoration: InputDecoration(
          errorText: errorText,
          
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          prefixIcon: Icon(icon),
          labelText: label,
          labelStyle: const TextStyle(
            fontFamily: 'Fjalla',
          ),
        ),
      ),
    );
  }
}
