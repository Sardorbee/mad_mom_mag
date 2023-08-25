import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCardProfile extends StatelessWidget {
  CustomCardProfile({
    super.key,
   required this.widget,
    required this.leadingText,
    required this.onTap,
  });
  Widget widget;
  String leadingText;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Text(
          leadingText,
          style: const TextStyle(fontFamily: 'Fjalla'),
        ),
        trailing: widget,
      ),
    );
  }
}
