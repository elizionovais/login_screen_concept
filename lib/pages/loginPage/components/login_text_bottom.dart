import 'package:flutter/material.dart';

class LoginTextBottom extends StatelessWidget {
   LoginTextBottom({super.key, required this.text, required this.onPressed});
  String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300, letterSpacing: 0.5),
        ));
  }
}
