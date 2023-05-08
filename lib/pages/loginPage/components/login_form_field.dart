import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  LoginFormField({super.key, required this.title, required this.icon, required this.obscureText});

  String title;
  IconData icon;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, width: 1))),
      child: Form(
        child: TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            icon: Icon(icon, color: Colors.black),
            hintText: title,
            hintStyle: const TextStyle(color: Colors.black, fontSize: 15),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 30, right: 30, bottom: 30, left: 5),
          ),
        ),
      ),
    );
  }
}
