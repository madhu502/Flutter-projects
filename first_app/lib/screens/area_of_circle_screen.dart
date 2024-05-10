import 'package:first_app/model/area_of_circle.dart';
import 'package:flutter/material.dart';

class AreaOfCircleScreen extends StatefulWidget {
  const AreaOfCircleScreen({super.key});

  @override
  State<AreaOfCircleScreen> createState() => _AreaOfCircleScreenState();
}

class _AreaOfCircleScreenState extends State<AreaOfCircleScreen> {
  int? radius;
  double area = 0;

  final gap = const SizedBox(
    height: 8,
  );

  AreaOfCircleModel? areaOfCircleModel;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 143, 206, 240),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Area of Circle',
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
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Enter first no
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    radius = int.parse(value);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 134, 11, 3),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 2, 80, 4),
                      ),
                    ),
                    hintText: 'Enter radius',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter radius";
                    }
                    return null;
                  },
                ),
                gap,

                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        areaOfCircleModel = AreaOfCircleModel(radius: radius!);
                        area = areaOfCircleModel!.areaOfCircle();
                      });
                    }
                  },
                  child: const Text('Calculate'),
                ),
                gap,
                RichText(
                  text: TextSpan(
                      text: "A",
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "rea of Circle is : $area",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
