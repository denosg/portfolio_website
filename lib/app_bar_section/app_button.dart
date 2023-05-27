import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback scrollTo;
  final String text;

  AppButton({required this.scrollTo, required this.text});

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
