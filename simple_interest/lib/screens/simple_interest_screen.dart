import 'package:flutter/material.dart';
import 'package:simple_interest/model/simple_interest_model.dart';

class SimpleInterest extends StatefulWidget {
  const SimpleInterest({super.key});

  @override
  State<SimpleInterest> createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  int? principal;
  int? rate;
  int? time;
  int simpleinterest = 0;

  SimpleInterestModel? simpleInterestModel;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'SIMPLE INTEREST',
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
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  principal = int.parse(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Principal',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Principal";
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
                  rate = int.parse(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Rate of interest',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Rate";
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
                  time = int.parse(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Time',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Time";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      simpleInterestModel = SimpleInterestModel(
                        principal: principal!,
                        rate: rate!,
                        time: time!,
                      );
                      simpleinterest = simpleInterestModel!.simpleInterest();
                    });
                  }
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Simple Interest is : $simpleinterest',
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
