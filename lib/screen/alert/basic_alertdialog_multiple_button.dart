import 'package:flutter/material.dart';

class BasicAlertDialogMultipleButton extends StatelessWidget {
  const BasicAlertDialogMultipleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirm Action"),
      content: Text("Are you sure you want to proceed?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
