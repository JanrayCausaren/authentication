import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
   const AuthTextField({
    super.key,
    this.hintText,
    this.iconData,
    required this.controller, this.iconSize,
  });

  final TextEditingController controller;

  final String? hintText;
  final IconData? iconData;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    // print('this is in the textfield');
    return TextFormField(
      // style: TextStyle(color: Colors.red),
      onChanged: (value) => print(value),
      validator: (value) {
        return 'jasdf';
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14),
        isDense: true,
        hintText: hintText ?? 'Name or email',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 2), // tweak this until aligned
          child: Icon(iconData ?? Icons.email, color: Colors.blue, size: iconSize ?? 20),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 30, // shrink the default 48px box
          minHeight: 0,
        ),
      ),
    );
  }
}
