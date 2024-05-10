import 'package:flutter/material.dart';
import 'package:swap_two_numbers/model/swap_model.dart';

class SwapNumbers extends StatefulWidget {
  const SwapNumbers({super.key});

  @override
  State<SwapNumbers> createState() => _SwapNumbersState();
}

class _SwapNumbersState extends State<SwapNumbers> {
  int? first;
  int? second;
  int result = 0;

  SwapModel? swapModel;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: const Text(
          'Swapping Two Numbers',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
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
                    return "Please enter First Number";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  second = int.parse(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Second number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Second Number";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      swapModel = SwapModel(
                        first: first!,
                        second: second!,
                      );
                      result = swapModel!.swap();
                    });
                  }
                },
                child: const Text('Swap'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text('Numbers After Swap',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'First number: $first, Second number: $second ',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
