import 'package:flutter/material.dart';

class BillingSystemScreen extends StatefulWidget {
  const BillingSystemScreen({super.key});

  @override
  State<BillingSystemScreen> createState() => _BillingSystemScreenState();
}

class _BillingSystemScreenState extends State<BillingSystemScreen> {
  TimeOfDay? time = TimeOfDay.now();
  DateTime? date = DateTime.now();

  int totalDays = 1;
  int pricePerNight = 3200;
  double vatRate = 0.13;

  // Method to calculate subtotal
  int calculateSubtotal() {
    return totalDays * pricePerNight;
  }

  // Method to calculate total including VAT
  double calculateTotal() {
    double subtotal = calculateSubtotal().toDouble();
    double vatAmount = subtotal * vatRate;
    return subtotal + vatAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Time : ${time!.hour}:${time!.minute}',
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: time!,
                    );
                    if (newTime != null) {
                      setState(() {
                        time = newTime;
                      });
                    }
                  },
                  child: const Text('Change Time'),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                        'Check-In Date  : ${date!.day}/${date!.month}/${date!.year}'),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date!,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050));
                        if (newDate != null) {
                          setState(() {
                            date = newDate;
                          });
                        }
                      },
                      child: const Text('Change Date'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                        'Check-out Date : ${date!.day}/${date!.month}/${date!.year}'),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date!,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050));
                        if (newDate != null) {
                          setState(() {
                            date = newDate;
                          });
                        }
                      },
                      child: const Text('Change Date'),
                    ),
                  ],
                ),
              ],
            ),
            // Row(
            //   children: [
            //     const Text('Number of Days:'),
            //     const SizedBox(width: 10),
            //     Flexible(
            //       child: TextField(
            //         keyboardType: TextInputType.number,
            //         onChanged: (value) {
            //           setState(() {
            //             totalDays = int.tryParse(value) ?? 0;
            //           });
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Bill",
                    style: TextStyle(fontSize: 30),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text("Total Days"),
                      const Spacer(),
                      Text("$totalDays"),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text("Price per night"),
                      const Spacer(),
                      Text("$pricePerNight"),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text("Sub total"),
                      const Spacer(),
                      Text("${calculateSubtotal()}"),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text("VAT"),
                      const Spacer(),
                      Text("${(vatRate * 100).toStringAsFixed(0)}%"),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text("Total "),
                      const Spacer(),
                      Text("${calculateTotal()}"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
