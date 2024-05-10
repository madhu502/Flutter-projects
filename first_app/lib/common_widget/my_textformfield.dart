import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    required this.onChanged,
    required this.text,
    super.key,
  });

  final ValueChanged<String> onChanged;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        hintText: text,
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter name";
        }
        return null;
      },
    );
  }
}
