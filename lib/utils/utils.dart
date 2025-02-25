import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

//Basic Snackbar
void showBasicSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('This is a basic SnackBar!'),
    ),
  );
}

//custom SnackBar
void showCustomSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        'This is a custom SnackBar!',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating, // Floating above bottom
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.yellow,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Undo Clicked!')),
          );
        },
      ),
    ),
  );
}

//Persistent SnackBar
void showPersistentSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: const Text('Persistent SnackBar!'),
    duration: const Duration(days: 1), // Long-lasting
    action: SnackBarAction(
      label: 'Dismiss',
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// GlobalKey SnackBar
void showGlobalKeySnackBar() {
  scaffoldMessengerKey.currentState?.showSnackBar(
    const SnackBar(content: Text('This is a GlobalKey SnackBar!')),
  );
}

//dismissSnackBar
void dismissSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}
