
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDrawerListTile extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final IconData icon;
  Color? color;
  CustomDrawerListTile({
    super.key,
    this.color,
    required this.onTap,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        label,
        style: TextStyle(color: color ?? Colors.white),
      ),
      leading: Icon(
        icon,
        color: color ?? Colors.white,
      ),
    );
  }
}