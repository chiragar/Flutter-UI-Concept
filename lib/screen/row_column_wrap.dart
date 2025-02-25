import 'package:flutter/material.dart';

class RowColumnWrapWidget extends StatelessWidget {
  const RowColumnWrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Row Column Wrap")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row Example
            const Text("Row Example:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, // Spacing between items
              children: [
                Icon(Icons.star, size: 40, color: Colors.blue),
                Icon(Icons.favorite, size: 40, color: Colors.red),
                Icon(Icons.thumb_up, size: 40, color: Colors.green),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Start"),
                Text("Middle"),
                Text("End"),
              ],
            ),
            const SizedBox(height: 20), // Space between sections

            // Column Example
            const Text("Column Example:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item 1", style: TextStyle(fontSize: 18)),
                Text("Item 2", style: TextStyle(fontSize: 18)),
                Text("Item 3", style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 20),

            // Wrap Example
            const Text("Wrap Example (Auto Line Breaks):",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Wrap(
              spacing: 10, // Horizontal spacing
              runSpacing: 10, // Vertical spacing
              children: [
                Chip(label: Text("Flutter")),
                Chip(label: Text("Dart")),
                Chip(label: Text("Firebase")),
                Chip(label: Text("Android")),
                Chip(label: Text("iOS")),
                Chip(label: Text("Web")),
                Chip(label: Text("Backend")),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(" Row (Overflow Issue)"),
            Row(
              children: List.generate(
                10,
                (index) => Chip(label: Text("Item $index")),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text("Solution"),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                10,
                (index) => Chip(label: Text("Item $index")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
