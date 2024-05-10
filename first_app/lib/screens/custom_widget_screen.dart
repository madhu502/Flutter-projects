import 'package:first_app/common_widget/my_button.dart';
import 'package:first_app/common_widget/my_textformfield.dart';
import 'package:flutter/material.dart';

class CustomWidgetScreen extends StatefulWidget {
  const CustomWidgetScreen({super.key});

  @override
  State<CustomWidgetScreen> createState() => _CustomWidgetScreenState();
}

class _CustomWidgetScreenState extends State<CustomWidgetScreen> {
  int? first;
  int? second;
  int result = 0;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyTextFormField(
                onChanged: (value) {
                  setState(() {
                    first = int.parse(value);
                  });
                },
                text: 'Enter first'),
            const SizedBox(
              height: 10,
            ),
            MyTextFormField(
                onChanged: (value) {
                  setState(() {
                    second = int.parse(value);
                  });
                },
                text: 'Enter Second'),
            MyButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    result = first! + second!;
                  });
                }
              },
              text: 'Add ',
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Result is : $result',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
