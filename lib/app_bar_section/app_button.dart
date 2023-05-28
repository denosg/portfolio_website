import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback scrollTo;
  final String text;

  // ignore: use_key_in_widget_constructors
  const AppButton({required this.scrollTo, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: scrollTo,
      child: Text(text,
          style: const TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black)),
    );
  }
}
