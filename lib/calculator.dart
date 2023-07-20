// ignore_for_file: prefer_const_constructors

import 'package:calculator/calculator_data.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = '';
  String result = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "Simple Calculator",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            centerTitle: true,
          ),
          
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                equation,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 32,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 56,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: GridView.builder(
                padding: EdgeInsets.all(24),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final number = calculatorData[index];
                  return TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    onPressed: () {
                      switch (number) {
                        case "1":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "2":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "3":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "4":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "5":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "6":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "7":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "8":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "9":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "0":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "00":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "+":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "-":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "*":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "/":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case ".":
                          {
                            setState(() {
                              equation += number;
                            });
                          }
                        case "AC":
                          {
                            setState(() {
                              equation = '';
                              result = '';
                            });
                          }
                        case "DE":
                          {
                            setState(() {
                              equation = equation.substring(0, equation.length - 1);
                            });
                          }
                        case "=":
                          {
                            setState(() {
                              try {
                                Parser p = Parser();
                                Expression expression = p.parse(equation);
                                ContextModel cm = ContextModel();
                                result = '${expression.evaluate(EvaluationType.REAL, cm)}';
                              } catch (e) {
                                result = "Error";
                              }
                            });
                          }
                      }
                    },
                    child: Text(
                      number,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
