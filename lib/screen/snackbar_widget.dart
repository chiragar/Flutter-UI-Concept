import 'package:flutter/material.dart';
import 'package:flutterui/utils/utils.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => showBasicSnackBar(context),
            child: const Text('Show Basic SnackBar'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => showCustomSnackBar(context),
            child: const Text('Show Custom SnackBar'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => showPersistentSnackBar(context),
            child: const Text('Show Persistent SnackBar'),
          ),
          const SizedBox(height: 10),
          const ElevatedButton(
            onPressed: showGlobalKeySnackBar,
            child: Text('Show GlobalKey SnackBar'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => dismissSnackBar(context),
            child: const Text('Dismiss SnackBar'),
          ),
        ],
      ),
    );
  }
}
