import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Grid View"),
          bottom: const TabBar(
            isScrollable: true, // Allows swiping
            tabs: [
              Tab(text: "Simple"),
              Tab(text: "Count"),
              Tab(text: "Builder"),
              Tab(text: "Extent "),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GridviewSimple(),
            GridviewCount(),
            GridviewBuilder(),
            GridviewExtent(),
          ],
        ),
      ),
    );
  }
}

class GridviewSimple extends StatelessWidget {
  const GridviewSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: [
        Container(color: Colors.blue, child: const Center(child: Text("1"))),
        Container(color: Colors.green, child: const Center(child: Text("2"))),
        Container(color: Colors.red, child: const Center(child: Text("3"))),
        Container(color: Colors.yellow, child: const Center(child: Text("4"))),
      ],
    );
  }
}

class GridviewBuilder extends StatelessWidget {
  const GridviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10, // Spacing between columns
        mainAxisSpacing: 10, // Spacing between rows
        childAspectRatio: 1, // Aspect ratio of each grid item
      ),
      itemCount: 20, // Number of items in the grid
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text("Builder Item $index",
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        );
      },
    );
  }
}

class GridviewCount extends StatelessWidget {
  const GridviewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // Number of columns
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(9, (index) {
        return Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: Text("Count Item $index",
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        );
      }),
    );
  }
}

class GridviewExtent extends StatelessWidget {
  const GridviewExtent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 100, // Each item can be at most 100 pixels wide
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(12, (index) {
        return Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: Text("Extent Item $index",
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        );
      }),
    );
  }
}
