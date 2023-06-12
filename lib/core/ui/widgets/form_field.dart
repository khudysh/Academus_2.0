import 'package:flutter/material.dart';
import 'package:academus_2/core/theme/const.dart';

typedef Validator = String? Function(String?);

class FormTextField extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final bool obscureText;
  final Validator? validator;
  final int? minLines;
  final int? maxLines;
  final String? label;
  final IconData? prefixIcon;

  const FormTextField({
    Key? key,
    this.obscureText = false,
    this.controller,
    this.decoration = const InputDecoration(),
    this.validator,
    this.minLines,
    this.maxLines,
    this.label,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.paddingBetweenStandart),
      child: TextFormField(
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(prefixIcon: Icon(prefixIcon), label: Text(label!)),
      ),
    );
  }
}