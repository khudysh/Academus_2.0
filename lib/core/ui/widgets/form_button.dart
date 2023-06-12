import 'package:flutter/material.dart';
import 'package:academus_2/core/theme/const.dart';

class FormButton extends StatelessWidget {
  final String btnText;
  final void Function()? onPressed;
  const FormButton({Key? key, required this.btnText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.paddingBetweenLarge),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  Const.paddingBetweenLarge + 30, vertical: Const.paddingBetweenStandart + 5),
          child: Text(btnText, style: TextStyle(fontSize: Const.fontSizeButton, color: Theme.of(context).colorScheme.tertiary)),
        ),
      ),
    );
  }
}