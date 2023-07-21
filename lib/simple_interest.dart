// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';

class InterestCalculator extends StatefulWidget {
  const InterestCalculator({super.key});

  @override
  State<InterestCalculator> createState() => _InterestCalculatorState();
}

class _InterestCalculatorState extends State<InterestCalculator> {
  @override
  void initState() {
    principleTextController = TextEditingController();
    timeTextController = TextEditingController();
    rateTextController = TextEditingController();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>(); //Created Global Key Here
  late TextEditingController principleTextController;
  late TextEditingController timeTextController;
  late TextEditingController rateTextController;

  handleForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      log("principle: ${principleTextController.text}");
      //log came from dart developer, it package. It helps to see log message in console in runtime which helps in debugging
    }
    var principle = int.parse(principleTextController.text);
    var time = int.parse(timeTextController.text);
    var rate = int.parse(rateTextController.text);

    var interest = (principle * time * rate) / 100;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "OUTCOME",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
                decoration: TextDecoration.underline,
              ),
            ),
            content: Text(
              "Simple Interest is $interest",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    principleTextController.dispose();
    rateTextController.dispose();
    timeTextController.dispose();
  }

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
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    //For using Validator, we need to use TextFormField instead of TextField
                    controller: principleTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Principle",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Principle is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      //For using Validator, we need to use TextFormField instead of TextField
                      controller: rateTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Rate",
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Rate is required";
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: timeTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Time",
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Time is required";
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        handleForm();
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
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                principleTextController.text = '';
                timeTextController.text = '';
                rateTextController.text = '';
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
