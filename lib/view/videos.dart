import 'package:flutter/material.dart';
import 'package:project2/utils/customWidgts.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const App_emoji_search(inputText: "Discover"),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SpotlightScreen(),
          ),
        ],
      ),
    );
  }
}

class SpotlightScreen extends StatelessWidget {
  final List<SpotlightItem> items = List.generate(
    20, // Generating 20 items
    (index) => SpotlightItem(
      color: Colors.primaries[index % Colors.primaries.length],
      title: 'Spotlight $index',
      description: 'Description for Spotlight $index',
    ),
  );

  SpotlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return buildSpotlightItem(items[index]);
        },
      ),
    );
  }

  Widget buildSpotlightItem(SpotlightItem item) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 620, // Adjust height as needed
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              item.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.black54,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 10,
            child: Text(
              item.description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                backgroundColor: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpotlightItem {
  final Color color;
  final String title;
  final String description;

  SpotlightItem({
    required this.color,
    required this.title,
    required this.description,
  });
}
