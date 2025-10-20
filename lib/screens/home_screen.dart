import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> operators = ['+', '-', 'x', '/', '%'];

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

  void evaluateExp() {
    if (userQuestion.isEmpty) {
      userAnswer = '';
      return;
    }

    try {
      String finalQuestion = userQuestion;
      finalQuestion = finalQuestion.replaceAll('x', '*');
      ExpressionParser p = GrammarParser();
      Expression exp = p.parse(finalQuestion);
      var context = ContextModel();
      var evaluator = RealEvaluator(context);
      num eval = evaluator.evaluate(exp);
      userAnswer = eval.toString();
    } catch (e) {
      userAnswer = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Calculator", style: TextStyle(color: Colors.grey)),
      ),

      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userQuestion,
                    style: TextStyle(color: Colors.white, fontSize: 48),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  //Clear Button
                  if (index == 0) {
                    return CButton(
                      color: Color.fromARGB(255, 27, 27, 27),
                      buttonText: buttons[index],
                      buttonTapped: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      },
                    );

                    //Delete Button
                  } else if (index == 2) {
                    return CButton(
                      color: Color.fromARGB(255, 27, 27, 27),
                      buttonText: buttons[index],
                      buttonTapped: () {
                          setState(() {
                            if (userQuestion.isNotEmpty) {
                              userQuestion = userQuestion.substring(
                                0,
                                userQuestion.length - 1,
                              );
                            }
                          });
                      },
                    );

                    //Equals-to Button
                  } else if (index == 19) {
                    return CButton(
                      color: Colors.deepOrange,
                      buttonText: buttons[index],
                      buttonTapped: () {
                        setState(() {
                          evaluateExp();
                        });
                      },
                    );
                  } else {
                    return CButton(
                      color: isOperator(buttons[index])
                          ? const Color.fromARGB(255, 27, 27, 27)
                          : const Color.fromARGB(255, 75, 75, 75),
                      buttonText: buttons[index],
                      buttonTapped: () {
                        String lastChar = userQuestion.isNotEmpty
                            ? userQuestion[userQuestion.length - 1]
                            : '';

                        if (userQuestion.isEmpty &&
                            isOperator(buttons[index])) {
                          return;
                        }

                        if (isOperator(buttons[index]) &&
                            operators.contains(lastChar)) {
                          return;
                        }

                        setState(() {
                          userQuestion += buttons[index];
                          evaluateExp();
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
