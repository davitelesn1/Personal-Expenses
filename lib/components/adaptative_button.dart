import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
final String label;
final Function onPressed;

AdaptativeButton({
  Key? key,
  required this.label,
  required this.onPressed,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            child: Text(label),
            onPressed: () => onPressed(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () => onPressed(),
          );
  }
}