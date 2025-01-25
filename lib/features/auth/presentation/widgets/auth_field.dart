import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;

  const AuthField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
