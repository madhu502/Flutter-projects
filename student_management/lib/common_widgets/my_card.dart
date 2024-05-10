import 'package:flutter/material.dart';
import 'package:student_management/model/student_model.dart';

class my_card extends StatelessWidget {
  const my_card({
    super.key,
    required this.students,
    required this.index,
  });

  final List<Student> students;
  final index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(students[index].fname),
              Text(students[index].lname),
            ],
          ),
        ),
      ),
    );
  }
}
