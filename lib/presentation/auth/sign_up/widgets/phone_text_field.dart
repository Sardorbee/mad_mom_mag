import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneTextField extends StatefulWidget {
  PhoneTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.textAlign,
    this.isPassword = false,
    required this.focusNode,
    this.obscureText = false,
    required this.maskFormaters,
    this.maxLine = 1,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final MaskTextInputFormatter maskFormaters;
  bool isPassword;
  // final IconData prefixIcon;
  final FocusNode focusNode;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  TextAlign textAlign;
  final bool obscureText;
  final ValueChanged onChanged;
  final int maxLine;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.019),
        color: Colors.black12,
      ),
      child: TextField(
        cursorColor: const Color(0xFF4F8962),
        maxLines: widget.maxLine,
        style: const TextStyle(
          fontSize: 18,
        ),
        textAlign: widget.textAlign,
        onChanged: widget.onChanged,
        inputFormatters: [widget.maskFormaters],
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 18),
          prefixIcon: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const SizedBox(
              width: 50,
              child: Row(
                children: [
                  // Icon(widget.prefixIcon, color: Colors.grey,),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "+998",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black12,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
