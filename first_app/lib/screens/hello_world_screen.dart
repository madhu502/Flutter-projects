import 'package:first_app/model/arithmetic_model.dart';
import 'package:flutter/material.dart';

class HelloWorldScreen extends StatefulWidget {
  const HelloWorldScreen({super.key});

  @override
  State<HelloWorldScreen> createState() => _HelloWorldScreenState();
}

class _HelloWorldScreenState extends State<HelloWorldScreen> {
  int? first;
  int? second;
  int result = 0;

  String group = 'my_group';

  ArithmeticModel? arithmeticModel;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add two numbers',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Enter first no
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  first = int.parse(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter first number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter first number";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  second = int.parse(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Second number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Second number";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),

              const SizedBox(
                height: 8,
              ),
              ListTile(
                title: const Text('Add'),
                leading: Radio(
                    value: 'add',
                    groupValue: group,
                    onChanged: (String? value) {
                      setState(() {
                        group = value!;
                      });
                    }),
              ),
              ListTile(
                title: const Text('Substract'),
                leading: Radio(
                    value: 'sub',
                    groupValue: group,
                    onChanged: (String? value) {
                      setState(() {
                        group = value!;
                      });
                    }),
              ),
              ListTile(
                title: const Text('Multiply'),
                leading: Radio(
                    value: 'mul',
                    groupValue: group,
                    onChanged: (String? value) {
                      setState(() {
                        group = value!;
                      });
                    }),
              ),
              ListTile(
                title: const Text('Divide'),
                leading: Radio(
                    value: 'div',
                    groupValue: group,
                    onChanged: (String? value) {
                      setState(() {
                        group = value!;
                      });
                    }),
              ),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      arithmeticModel = ArithmeticModel(
                        first: first!,
                        second: second!,
                      );
                      result = arithmeticModel!.add();
                    });
                  }
                },
                child: const Text('Calculate'),
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
      ),
    );
  }
}
