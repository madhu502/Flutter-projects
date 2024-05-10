import 'package:flutter/material.dart';
import 'package:student_management/common_widgets/my_card.dart';
import 'package:student_management/model/student_model.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({super.key});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  final _gap = const SizedBox(height: 10);

  // final _fnameController = TextEditingController();
  // final _lnameController = TextEditingController();
  // final _cityController = TextEditingController();

  late TextEditingController _fnameController;
  late TextEditingController _lnameController;
  late TextEditingController _cityController;

  // final cities = [
  //   const DropdownMenuItem(value: 'Kathmandu', child: Text('Kathmandu')),
  //   const DropdownMenuItem(value: 'Lalitpur', child: Text('Lalitpur')),
  //   const DropdownMenuItem(value: 'Bhaktapur', child: Text('Bhaktapur')),
  // ];

  List<DropdownMenuItem> cities = [];

  @override
  void initState() {
    _fnameController = TextEditingController(text: 'Madhu');
    _lnameController = TextEditingController();
    _cityController = TextEditingController();

    cities = [
      const DropdownMenuItem(value: 'Kathmandu', child: Text('Kathmandu')),
      const DropdownMenuItem(value: 'Bhaktapur', child: Text('Bhaktapur')),
      const DropdownMenuItem(value: 'Lalitpur', child: Text('Lalitpur')),
    ];
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _cityController.dispose();
    _lnameController.dispose();
    super.dispose();
  }

  final _key = GlobalKey<FormState>();

  List<Student> students = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: _fnameController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter fname';
                  }
                  return null;
                },
              ),
              _gap,
              TextFormField(
                controller: _lnameController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Last Name';
                  }
                  return null;
                },
              ),
              _gap,
              DropdownButtonFormField(
                items: cities,
                onChanged: (value) {
                  _cityController.text = value.toString();
                },
                decoration: const InputDecoration(
                  hintText: 'Select city',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select city';
                  }
                  return null;
                },
              ),
              _gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      final student = Student(
                        fname: _fnameController.text,
                        lname: _lnameController.text,
                        city: _cityController.text,
                      );
                      setState(() {
                        students.add(student);
                      });
                    }
                  },
                  child: const Text('Add Student'),
                ),
              ),
              _gap,
              const Text(
                'Student List',
                style: TextStyle(fontSize: 20),
              ),
              _gap,
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return my_card(
                      students: students,
                      index: index,
                    );
                    // return ListTile(
                    //   title: Text(students[index].fname),
                    //   subtitle: Text(students[index].city),
                    //   trailing: IconButton(
                    //     icon: const Icon(Icons.delete),
                    //     onPressed: () {
                    //       setState(() {
                    //         students.removeAt(index);
                    //       });
                    //     },
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
