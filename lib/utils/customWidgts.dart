import 'package:flutter/material.dart';
import 'package:project2/utils/colors.dart';

class ReusableButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final btnColour;
  final btnChild;
  final btnHeight;
  final btnWidth;
  final btnCircularRadius;
  const ReusableButton(
      {super.key,
      this.btnCircularRadius,
      this.btnWidth,
      this.btnHeight,
      this.btnChild,
      this.btnColour});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: btnHeight,
      width: btnWidth,
      decoration: BoxDecoration(
        color: btnColour,
        borderRadius: BorderRadius.circular(btnCircularRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: btnChild,
    );
  }
}

Widget CenterTextContainer(
    {required double tHeight,
    required double tLeft,
    required String cText,
    required double fSize,
    required Color tColor}) {
  print(
      'tLeft: $tLeft,tHeight: $tHeight, cText: $cText, fSize: $fSize, tColor: $tColor');

  return Container(
    child: Padding(
      padding: EdgeInsets.only(top: tHeight, left: tLeft),
      child: Container(
        child: Text(
          cText,
          style: TextStyle(
            fontSize: fSize,
            color: tColor,
          ),
        ),
      ),
    ),
  );
}

class CustomCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent // Make the rest transparent
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = whiteColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4; // Adjust stroke width as needed

    // Draw the transparent circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );

    // Draw the border
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleContainer extends StatelessWidget {
  const CircleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: CustomPaint(
        painter: CustomCircle(),
      ),
    );
  }
}

class Emoji extends StatelessWidget {
  final String imagePath;
  final double left;
  final double top;
  final Color avatarColor;

  const Emoji({
    super.key,
    required this.imagePath,
    required this.left,
    required this.top,
    this.avatarColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
      ),
      child: SizedBox(
        width: 45,
        height: 45,
        child: Center(
          child: CircleAvatar(
            backgroundColor: avatarColor,
            foregroundImage: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}

// class App_emoji_search extends StatelessWidget {
//   final String inputText;
//   const App_emoji_search({
//     required this.inputText,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Emoji(
//           imagePath: 'assests/Icons/emoji.png',
//           left: 13,
//           top: 54,
//           avatarColor: backgrounsColor,
//         ),
//         const Emoji(
//           imagePath: 'assests/Icons/Search.png',
//           left: 13,
//           top: 54,
//           avatarColor: backgrounsColor,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 10, top: 65),
//           child: SizedBox(
//             width: 100,
//             height: 27,
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 20,
//                 bottom: 6,
//               ),
//               child: Text(
//                 inputText,
//                 style: const TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//         const Emoji(
//           imagePath: 'assests/Icons/add_friend.png',
//           left: 60,
//           top: 54,
//           avatarColor: backgrounsColor,
//         ),
//       ],
//     );
//   }
// }

class TextDivider extends StatelessWidget {
  final double indent;
  final double endIndent;
  final double top;

  const TextDivider({
    super.key,
    required this.indent,
    required this.endIndent,
    required this.top,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: top),
        child: Divider(
          color: Colors.black, // Color of the divider
          thickness: 0.5,
          indent: indent,
          endIndent: endIndent,
        ),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: SizedBox(
            width: 60,
            height: 60,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                foregroundImage: AssetImage('assests/Icons/emoji.png'),
              ),
            ),
          ),
          title: Text(items[index]),
        );
      },
    );
  }
}

class Chat {
  final String username;
  final String message;
  final String time;
  final String avatarUrl;

  Chat({
    required this.username,
    required this.message,
    required this.time,
    required this.avatarUrl,
  });
}

class ChatListTile extends StatelessWidget {
  final Chat chat;

  const ChatListTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chat.avatarUrl),
      ),
      title: Text(
        chat.username,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(chat.message),
      trailing: Text(chat.time),
      onTap: () {
        // Handle on tap
      },
    );
  }
}

class App_emoji_search extends StatelessWidget {
  final String inputText;
  const App_emoji_search({
    required this.inputText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 55),
      child: Container(
        width: 330,
        height: 50,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: CircleAvatar(
                radius: 25,
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/user_profile');
                    },
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 38,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 64),
              child: CircleAvatar(
                radius: 24,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 38,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, top: 18),
              child: Text(inputText, style: TextStyle(fontSize: 24)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 260),
              child: CircleAvatar(
                radius: 24,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person_add_alt_1_outlined,
                      size: 34,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
