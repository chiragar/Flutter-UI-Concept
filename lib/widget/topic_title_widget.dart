import 'package:flutter/material.dart';

class TopicTitleWidget extends StatelessWidget {
  final String title;
  const TopicTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const Divider(),
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Divider(),
        const SizedBox(height: 4),
      ],
    );
  }
}
