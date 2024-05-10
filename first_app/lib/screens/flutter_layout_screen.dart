import 'package:flutter/material.dart';

class FlutterLayoutScreen extends StatelessWidget {
  const FlutterLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Layout',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(20),
            
          ),
          
          height: 50,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.phone),
                  Text("Call"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.route),
                  Text("Route"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.share),
                  Text("Share"),
                ],
              ),

            ],
          ),
        ));
  }
}
