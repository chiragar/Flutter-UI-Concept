import 'package:flutter/material.dart';
import 'package:flutterui/screen/alert/basic_alertdialog_listview_button.dart';

import 'basic_alertdialog.dart';
import 'basic_alertdialog_icon_button.dart';
import 'basic_alertdialog_multiple_button.dart';
import 'basic_alertdialog_textinput_button.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        const BasicAlertDialog());
              },
              child: const Text("Basic AlertDialog")),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        const BasicAlertDialogMultipleButton());
              },
              child: const Text("AlertDialog with Multiple Buttons")),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        const BasicAlertDialogIconButton());
              },
              child: const Text("AlertDialog with Icon")),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        BasicAlertDialogTextInputButton());
              },
              child: const Text("AlertDialog with Text Input")),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        BasicAlertDialogListViewButton());
              },
              child: const Text("AlertDialog with ListView")),
        ],
      ),
    );
  }
}
