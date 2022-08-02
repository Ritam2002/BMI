import 'dart:html';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  }) : super(key: key);

  final Gender gender;
  final int height;
  final int weight;
  final int age;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmi = 0.0;
  String result = '';
  String gender = '';
  String img = '';

  void calculate() {
    setState(() {
      gender = this.widget.gender == Gender.male ? 'male' : 'female';

      bmi = this.widget.weight /
          ((this.widget.height / 100) * (this.widget.height / 100));
      if (bmi < 18.5) {
        result = 'UnderWeight';
      } else if (bmi < 25) {
        result = 'Normal';
      } else if (bmi < 30) {
        result = 'OverWeight';
      } else if (bmi < 35) {
        result = 'Obese';
      } else {
        result = 'ExtremelyObese';
      }

      img = 'Images/${gender}_${result}.png';
    });
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();

    setState(() {
      calculate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(34, 148, 138, 138),
          title: Center(child: Text('RESULT'))),
      body: Center(
        child: Container(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(34, 148, 138, 138),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(this.img),
                      height: 300,
                      width: 400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'YOUR SCORE:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${this.bmi}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(34, 148, 138, 138))),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 40,
                    ),
                    child: Center(
                      child: Text(
                        'RESULT: ${result}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 168, 11, 63),
                    ),
                    height: 50,
                    margin: EdgeInsets.symmetric(
                      horizontal: 150,
                    ),
                    child: Center(
                      child: Text(
                        'RECALCULATE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
