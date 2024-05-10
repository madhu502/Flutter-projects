import 'package:first_app/common_widget/my_button.dart';
import 'package:first_app/common_widget/my_snackbar.dart';
import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.green,
              child: Center(
                  child: MyButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Button 1"),
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      text: 'Click')),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: Center(
                  child: MyButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(mySnackBar(
                            message: "message",
                            context: context,
                            color: Colors.pink));
                      },
                      text: 'Click')),
            ),
          ),
        ],
      ),
    );
  }
}
