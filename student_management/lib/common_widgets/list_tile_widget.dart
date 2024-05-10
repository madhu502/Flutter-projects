import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    required this.imageName,
    // required this.index,
    required this.text,
    required this.subtitle,
    required this.sideImage,
    super.key,
  });
  // final int index;
  final String imageName;
  final String text;
  final String subtitle;
  final String sideImage;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          imageName,
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: Wrap(
        spacing: 8,
        children: [
          Image.asset(
            sideImage,
            height: 40,
            width: 35,
          )
        ],
      ),
      onTap: () {},
    );
  }
}
