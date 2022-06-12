import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool enablaed;
  const FieldWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.onChanged,
    this.controller,
    this.enablaed = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: label,
          prefixIcon: Icon(icon),
          labelStyle: const TextStyle(color: Colors.black),
          border: const OutlineInputBorder(),
          enabled: enablaed),
    );
  }
}
