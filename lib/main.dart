// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double principle = 0, rate = 0, time = 0, result = 0;
  void interest() {
    setState(() {
      result = (principle * rate * time) / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculator",
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter the Principle",
                    label: Text(
                      "Principle",
                    ),
                  ),
                  keyboardType: TextInputType.number,
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter the Rate",
                    label: Text(
                      "Rate",
                    ),
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter the Time",
                    label: Text(
                      "Time",
                    ),
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
