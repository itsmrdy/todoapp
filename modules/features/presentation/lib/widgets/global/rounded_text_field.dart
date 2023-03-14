import 'package:flutter/material.dart';

class RoundedTextField extends StatefulWidget {
  const RoundedTextField({
    required this.onChanged,
    this.hintText,
    this.onTap,
    this.controller,
  });
  final Function(String) onChanged;
  final Function()? onTap;
  final String? hintText;
  final TextEditingController? controller;
  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        decoration: InputDecoration(
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
