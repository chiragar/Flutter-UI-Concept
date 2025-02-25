import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dismissible"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              key: Key(item), // Unique key for each item
              direction:
                  DismissDirection.horizontal, // Allow both swipe directions
              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.archive, color: Colors.white),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              confirmDismiss: (direction) async {
                return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm"),
                        content: Text(direction == DismissDirection.startToEnd
                            ? "Do you want to archive this item?"
                            : "Do you want to delete this item?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("Yes"),
                          ),
                        ],
                      );
                    });
              },
              onDismissed: (direction) {
                String deletedItem = items[index];
                int deletedIndex = index;

                setState(() {
                  items.removeAt(index);
                });

                String action = direction == DismissDirection.startToEnd
                    ? "archived"
                    : "deleted";

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$deletedItem $action"),
                    action: SnackBarAction(
                      label: "Undo",
                      onPressed: () {
                        setState(() {
                          items.insert(deletedIndex, deletedItem);
                        });
                      },
                    ),
                  ),
                );
              },
              child: ListTile(
                title: Text(item),
                tileColor: Colors.grey[200],
              ),
            );
          }),
    );
  }
}
