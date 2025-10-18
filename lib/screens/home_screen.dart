import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> buttons = [
    'AC',
    '%',
    'DEL',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '00',
    '0',
    '.',
    '=',
  ];

  bool isOperator(String x) {
    return ['AC', '%', 'DEL', '/', 'x', '-', '+'].contains(x);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Calculator", style: TextStyle(color: Colors.grey)),
      ),

      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(decoration: BoxDecoration(color: Colors.black)),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CButton(
                      color: buttons[index] == '='
                          ? Colors.deepOrange
                          : isOperator(buttons[index])
                              ? const Color.fromARGB(255, 27, 27, 27)
                              : const Color.fromARGB(255, 75, 75, 75),
                      buttonText: buttons[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
