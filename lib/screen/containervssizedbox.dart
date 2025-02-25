import 'package:flutter/material.dart';

class ContainerVsSizedBox extends StatelessWidget {
  const ContainerVsSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container V/S SizedBox"),
      ),
      body: Column(
        children: [
          Container(
            width: 200,
            height: 100,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: const Text(
              'Hello, Flutter!',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20), // Adds vertical space
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Click Me'),
            ),
          ),
        ],
      ),
    );
  }
}
