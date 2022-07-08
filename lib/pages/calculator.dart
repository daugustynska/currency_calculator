import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int currentIndex = 0;
  String? result = "";
  TextEditingController zlotyController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  double zloty = 0;
  double rate = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Currency calculator",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Colors.grey[300],
          //settings page to be added
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, color: Colors.black),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your money in zloty:",
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: zlotyController,
                  decoration: InputDecoration(
                    hintText: "Your money value",
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(
                        width: 0.0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Euro rate:",
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: rateController,
                  decoration: InputDecoration(
                    hintText: "Euro rate",
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(
                        width: 0.0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        zloty = double.parse(zlotyController.value.text);
                        rate = double.parse(rateController.value.text);
                      });
                      calculateCurrency(zloty, rate);
                    },
                    style: TextButton.styleFrom(
                      //  primary: Colors.purpleAccent,
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: const Text(
                    "You have this much euro:",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$result",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateCurrency(double zloty, double rate) {
    double finalResult = zloty / rate;
    String calculatedEuro = finalResult.toStringAsFixed(2);
    setState(() {
      result = calculatedEuro;
    });
  }
}
