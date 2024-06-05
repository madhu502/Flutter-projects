import 'dart:math';
import 'package:flutter/material.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  late Color _color;

  int _firstNumber = 0;
  int _secondNumber = 0;

  int noOfCount = 1;

  int correctAnswer = 0;
  int incorrectAnswer = 0;

  @override
  void initState() {
    _color = Colors.yellow;
    _generateRandomNumber();
    super.initState();
  }

  _generateRandomNumber() {
    Random random = Random();
    _firstNumber = random.nextInt(100) + 1;
    _secondNumber = random.nextInt(100) + 1;

    while (_firstNumber == _secondNumber) {
      _secondNumber = random.nextInt(100) + 1;
    }

    noOfCount++; // increment the count
  }

  void _restartGame() {
    setState(() {
      _color = Colors.yellow;
      _firstNumber = 0;
      _secondNumber = 0;
      noOfCount = 0;
      correctAnswer = 0;
      incorrectAnswer = 0;
      _generateRandomNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Generator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: noOfCount == 12
                        ? null
                        : () {
                            setState(() {
                              if (_firstNumber > _secondNumber) {
                                correctAnswer++;
                                _color = Colors.green;
                              } else {
                                incorrectAnswer++;
                                _color = Colors.red;
                              }
                              _generateRandomNumber();
                            });
                          },
                    child: Text(
                      _firstNumber.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 180,
                  height: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: noOfCount == 12
                        ? null
                        : () {
                            setState(() {
                              if (_secondNumber > _firstNumber) {
                                correctAnswer++;
                                _color = Colors.green;
                              } else {
                                incorrectAnswer++;
                                _color = Colors.red;
                              }
                              _generateRandomNumber();
                            });
                          },
                    child: Text(
                      _secondNumber.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Correct Answer: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            correctAnswer.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Incorrect Answer: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            incorrectAnswer.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _restartGame();
                        },
                        child: const Text('Restart Game'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
