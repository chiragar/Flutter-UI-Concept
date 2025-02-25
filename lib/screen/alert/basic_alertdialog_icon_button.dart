import 'package:flutter/material.dart';

class BasicAlertDialogIconButton extends StatelessWidget {
  const BasicAlertDialogIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.warning, color: Colors.red),
          SizedBox(width: 10),
          Text("Warning"),
        ],
      ),
      content: const Text("This action is irreversible."),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.yellow[100],
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Dismiss", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
