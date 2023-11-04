import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool obscureText;

  CustomTextField({
    required this.label,
    required this.hint,
    required this.icon,
    this.obscureText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            suffixIcon: Icon(widget.icon),
            floatingLabelBehavior:
                FloatingLabelBehavior.always, // Make the label always visible
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(10), // Customize corner radius
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(10), // Customize corner radius
              borderSide:
                  BorderSide(color: Colors.grey), // Change focused border color
            ),
          ),
        ),
      ),
    );
  }
}