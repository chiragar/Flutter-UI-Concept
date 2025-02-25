import 'package:flutter/material.dart';

class BasicAlertDialogTextInputButton extends StatelessWidget {
  BasicAlertDialogTextInputButton({super.key});

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enter Your Name"),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: "Your name"),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.yellow[100],
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            print("User Input: ${_controller.text}");
            Navigator.pop(context);
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
