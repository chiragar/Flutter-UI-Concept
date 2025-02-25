import 'package:flutter/material.dart';

class BasicAlertDialogListViewButton extends StatelessWidget {
  BasicAlertDialogListViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select an Option"),
      content: Container(
          width: double.maxFinite,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Option ${index + 1}"),
                  onTap: () {
                    print("Selected Option ${index + 1}");
                    Navigator.pop(context);
                  },
                );
              })),
    );
  }
}
