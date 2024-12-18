import 'package:flutter/material.dart';
import 'package:project2/utils/customWidgts.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  final List<Item> items = List.generate(
    20, // You can change this number to generate more or fewer items
    (index) => Item(
      title: 'Item $index',
      color: Colors.primaries[index % Colors.primaries.length],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const App_emoji_search(inputText: "Stories"),
          Padding(
            padding: const EdgeInsets.only(top: 116, left: 13),
            child: SizedBox(
                width: 370,
                height: 22,
                child: Stack(
                  children: [
                    const Text(
                      "Fridends",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1, left: 245),
                      child: Container(
                        height: 20,
                        width: 75,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Color(0xFFC4C4C4),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Color(0xFFC837AB),
                            ),
                            Text(
                              "My Story",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 254),
            child: SizedBox(
              height: 1229,
              width: 1370,
              child: buildGridView(items),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String title;
  final Color color;
  Item({
    required this.title,
    required this.color,
  });
}

Widget buildGridView(List<Item> items) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number of columns
      childAspectRatio: 1, // Aspect ratio of each item
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
      return buildGridItem(items[index]);
    },
  );
}

Widget buildGridItem(Item item) {
  return Container(
    margin: const EdgeInsets.all(6.0),
    color: item.color,
    child: Center(
      child: Text(
        item.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    ),
  );
}
