// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InterestCalculator extends StatefulWidget {
  const InterestCalculator({super.key});

  @override
  State<InterestCalculator> createState() => _InterestCalculatorState();
}

class _InterestCalculatorState extends State<InterestCalculator> {
  double principle = 0, rate = 0, time = 0, result = 0;
  void interest() {
    setState(() {
      result = (principle * rate * time) / 100;
    });
  }

  final principleTextController = TextEditingController();
  final timeTextController = TextEditingController();
  final rateTextController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();

  // handleForm() {
  //   if (!_formKey.currentState!.validate()) {
  //     return;
  //   }
  //   log("principle: ${principleTextController.text}");
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Interest Calculator",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: principleTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // hintText: "Enter the Principle",
                      // label: Text(
                      //   "Principle",
                      // ),
                      labelText: "Principle",
                    ),
                    keyboardType: TextInputType.number,
                    // validator: (String? value) {
                    //   if (value!.isEmpty) {
                    //     return "Principle is required";
                    //   }
                    //   return "Done";
                    // },
                    onChanged: (String value) {
                      setState(
                        () {
                          principle = double.tryParse(value) ?? 0;
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: rateTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // hintText: "Enter the Rate",
                      // label: Text(
                      //   "Rate",
                      // ),
                      labelText: "Rate",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      setState(() {
                        rate = double.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: timeTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // hintText: "Enter the Time",
                      // label: Text(
                      //   "Time",
                      // ),
                      labelText: "Time",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      time = double.tryParse(value) ?? 0;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        interest();
                        // handleForm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Simple Interest is: $result",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                principle = 0;
                rate = 0;
                time = 0;
                result = 0;
              },
            );
          },
          child: Icon(
            Icons.restore,
          ),
        ),
      ),
    );
  }
}
