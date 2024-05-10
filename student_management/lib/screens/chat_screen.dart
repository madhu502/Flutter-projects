import 'package:flutter/material.dart';
import 'package:student_management/common_widgets/list_tile_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.explore,
              color: Colors.red,
            ),
            Text(
              '  Discover',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            (ListTileWidget(
              imageName: 'assets/images/a.png',
              text: 'Iwan Riley',
              sideImage: 'assets/images/b.png',
              subtitle: '6h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/b.png',
              text: 'Robby Harrington',
              sideImage: 'assets/images/c.png',
              subtitle: '8h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/c.png',
              text: 'Ryoko',
              sideImage: 'assets/images/d.png',
              subtitle: '9h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/d.png',
              text: 'Uhooo',
              sideImage: 'assets/images/e.png',
              subtitle: '13h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/f.png',
              text: 'Hannah Beth',
              sideImage: 'assets/images/a.png',
              subtitle: '13h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/c.png',
              text: 'Paul Davison',
              sideImage: 'assets/images/f.png',
              subtitle: '20h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/d.png',
              text: 'Colt Hart',
              sideImage: 'assets/images/a.png',
              subtitle: '6h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/c.png',
              text: 'Iwan Riley',
              sideImage: 'assets/images/b.png',
              subtitle: '21h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/d.png',
              text: 'Kaleah Jean Morlan',
              sideImage: 'assets/images/f.png',
              subtitle: '23h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/d.png',
              text: 'Kaleah Jean Morlan',
              sideImage: 'assets/images/f.png',
              subtitle: '23h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/d.png',
              text: 'Kaleah Jean Morlan',
              sideImage: 'assets/images/f.png',
              subtitle: '23h ago',
            )),
            (ListTileWidget(
              imageName: 'assets/images/d.png',
              text: 'Kaleah Jean Morlan',
              sideImage: 'assets/images/f.png',
              subtitle: '23h ago',
            )),
          ],
        ),
      ),
    );
  }
}
