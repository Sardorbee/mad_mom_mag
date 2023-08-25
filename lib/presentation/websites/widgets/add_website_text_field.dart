import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class WebsiteTextField extends StatelessWidget {
  final String label;
  final TextInputType type;
  bool obscure;
  TextEditingController? controller;
  String? errorText;
  List<TextInputFormatter>? inputFormatter;
  ValueChanged? onChanged;
  int? maxLines;
  int? maxLength;

  Widget? suffixIcon;
  WebsiteTextField(
      {super.key,
      this.errorText,
      this.maxLines,
      this.maxLength,
      this.inputFormatter,
      this.suffixIcon,
      required this.label,
      required this.type,
      this.onChanged,
      this.obscure = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.019),
        color: Colors.black12,
      ),
      child: TextFormField(

        maxLength: maxLength,
        maxLines: maxLines,
        onChanged: onChanged,
        inputFormatters: inputFormatter,
        controller: controller,
        obscureText: obscure,
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          errorText: errorText,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(
            fontFamily: 'Fjalla',
          ),
        ),
      ),
    );
  }
}
