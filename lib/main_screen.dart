import 'package:flutter/material.dart';
import 'package:flutterui/screen/alert/alert_dialog_widget.dart';
import 'package:flutterui/screen/containervssizedbox.dart';
import 'package:flutterui/screen/dismissibleWidget.dart';
import 'package:flutterui/screen/drawer/drawer_widget.dart';
import 'package:flutterui/screen/drawer/navigation_drawer_widget.dart';
import 'package:flutterui/screen/gridview_widget.dart';
import 'package:flutterui/screen/image/image_widget.dart';
import 'package:flutterui/screen/listview_widget.dart';
import 'package:flutterui/screen/row_column_wrap.dart';
import 'package:flutterui/screen/snackbar_widget.dart';
import 'package:flutterui/screen/textandelevatedbutton.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            commonTitle(
                context: context,
                title: "Container vs SizedBox",
                classname: const ContainerVsSizedBox()),
            commonTitle(
                context: context,
                title: "Row Column Wrap",
                classname: const RowColumnWrapWidget()),
            commonTitle(
                context: context,
                title: "Button Widget",
                classname: const ButtonWidget()),
            commonTitle(
                context: context,
                title: "ListView Widget",
                classname: const ListViewWidget()),
            commonTitle(
                context: context,
                title: "GridView Widget",
                classname: const GridViewWidget()),
            commonTitle(
                context: context,
                title: "SnackBar Widget",
                classname: const SnackBarWidget()),
            commonTitle(
                context: context,
                title: "Dismissible Widget (Swipe List Like Gmail)",
                classname: const DismissibleWidget()),
            commonTitle(
                context: context,
                title: "Drawer",
                classname: const DrawerWidget()),
            commonTitle(
                context: context,
                title: "Drawer (Material 3 )",
                classname: const NavigationDrawerWidget()),
            commonTitle(
                context: context,
                title: "Image Widget",
                classname: const ImageWidget()),
            commonTitle(
                context: context,
                title: "Alert Widget",
                classname: AlertDialogWidget()),
          ],
        ),
      ),
    );
  }

  ListTile commonTitle(
          {required BuildContext context, required String title, classname}) =>
      ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => classname)),
        title: Text(title),
      );
}
