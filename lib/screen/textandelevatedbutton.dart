import 'package:flutter/material.dart';
import 'package:flutterui/widget/topic_title_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Button Widget")),
      body: Column(
        children: [
          const TopicTitleWidget(title: "Text Button"),
          commonRow(
            simple: TextButton(
              onPressed: () {
                print("TextButton Pressed");
              },
              child: const Text("Click Me"),
            ),
            extra: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Text color
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Text Button"),
            ),
          ),
          const SizedBox(height: 20),
          const TopicTitleWidget(title: "Elevated Button:"),
          commonRow(
              simple: ElevatedButton(
                onPressed: () {
                  print("ElevatedButton Pressed");
                },
                child: const Text("Click Me"),
              ),
              extra: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                  foregroundColor: Colors.white, // Text color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5, // Shadow effect
                ),
                child: const Text("Elevated Button"),
              )),
          const SizedBox(height: 20),
          const TopicTitleWidget(title: "Outlined Button:"),
          commonRow(
              simple: OutlinedButton(
                onPressed: () {
                  print("Outlined Button Pressed");
                },
                child: const Text("Click Me"),
              ),
              extra: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue, // Text color
                  side: const BorderSide(
                      color: Colors.blue, width: 2), // Border color and width
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Outlined Button"),
              )),
          const SizedBox(height: 20),
          const TopicTitleWidget(title: "Icon Button:"),
          commonRow(
              simple: IconButton(
                onPressed: () {
                  print("Icon Button Pressed");
                },
                icon: const Icon(Icons.favorite),
              ),
              extra: IconButton(
                onPressed: () {
                  print("Favorite Pressed");
                },
                icon: const Icon(Icons.favorite),
                color: Colors.red, // Icon color
                iconSize: 30, // Icon size
                tooltip: "Add to Favorites", // Tooltip on long press
                splashRadius: 25, // Ripple effect radius
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
                color: Colors.blue,
                tooltip: "Like",
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment),
                color: Colors.green,
                tooltip: "Comment",
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
                color: Colors.purple,
                tooltip: "Share",
              ),
            ],
          )
        ],
      ),
    );
  }

  Row commonRow({required Widget simple, required Widget extra}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [const Text("Text Button"), simple],
          ),
          Column(
            children: [const Text("With Feature"), extra],
          ),
        ],
      );
}
