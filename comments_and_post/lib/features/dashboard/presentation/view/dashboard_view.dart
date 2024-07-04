import 'package:comments_and_post/features/comments/presentation/view/comment_view.dart';
import 'package:comments_and_post/features/photo/presentation/view/photo_view.dart';
import 'package:flutter/material.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 91, 5, 197),
        title: const Text('Pagination Flutter'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        padding: const EdgeInsets.all(8.0),
        children: [
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CommentView(),
                  ),
                );
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.comment,
                    size: 70.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Comment',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhotosView(),
                  ),
                );
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    size: 70.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Photos',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
