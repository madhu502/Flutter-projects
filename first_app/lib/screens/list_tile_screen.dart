import 'package:first_app/common_widget/listtile_widget.dart';
import 'package:flutter/material.dart';

class ListTileScreen extends StatelessWidget {
  const ListTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'List Tile',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i <= 10; i++) ...{
              if (i % 2 == 0) ...{
                ListTileWidget(
                  index: i,
                  imageName: 'assets/images/image_2.jpeg',
                ),
              } else ...{
                ListTileWidget(
                  index: i,
                  imageName: 'assets/images/image_1.jpeg',
                ),
              }
            }
          ],
        ),
      ),
    );
  }
}
