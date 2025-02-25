import 'package:flutter/material.dart';

class BasicAlertDialog extends StatelessWidget {
  const BasicAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Alert"),
      content: const Text("This is a basic alert dialog."),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    );
  }
}
