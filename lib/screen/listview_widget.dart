import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ListView"),
          bottom: const TabBar(
            isScrollable: true, // Allows swiping
            tabs: [
              Tab(text: "Default"),
              Tab(text: "Builder"),
              Tab(text: "Separated"),
              Tab(text: "Custom"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DefaultListView(),
            BuilderListView(),
            SeparatedListView(),
            CustomListView(),
          ],
        ),
      ),
    );
  }
}

// 1. Default ListView (Static)
class DefaultListView extends StatelessWidget {
  const DefaultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: List.generate(5, (index) {
        return Card(
          child: ListTile(
            title: Text("Item ${index + 1}"),
            leading: const Icon(Icons.list),
          ),
        );
      }),
    );
  }
}

// 2. ListView.builder (Efficient for large lists)
class BuilderListView extends StatelessWidget {
  const BuilderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 20, // Dynamic list
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Item ${index + 1}"),
          leading: const Icon(Icons.check_circle),
        );
      },
    );
  }
}

// 3. ListView.separated (With dividers)
class SeparatedListView extends StatelessWidget {
  const SeparatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Item ${index + 1}"),
          leading: const Icon(Icons.star),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(thickness: 1);
      },
    );
  }
}

// 4. ListView.custom (Advanced customization)
class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            title: Text("Custom Item ${index + 1}"),
            leading: const Icon(Icons.widgets),
          );
        },
        childCount: 15, // Number of items
      ),
    );
  }
}
