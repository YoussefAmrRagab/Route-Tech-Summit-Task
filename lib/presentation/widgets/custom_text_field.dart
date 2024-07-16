import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.inputBorder,
    this.prefixIcon,
    this.controller,
    this.height,
    this.width,
    this.style,
    this.onTextChanged,
  });

  final String hintText;
  final InputBorder? inputBorder;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final TextStyle? style;
  final Function(String text)? onTextChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        cursorColor: Colors.black,
        controller: controller,
        onChanged: onTextChanged,
        style: style,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: prefixIcon,
          ),
          labelText: hintText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
        ),
      ),
    );
  }
}
