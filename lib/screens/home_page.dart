import 'package:bmi/components/custom_card.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Gender gender_selected = Gender.male;

  int height = 150;
  int weight = 50;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(34, 148, 138, 138),
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: GenderCard(
                  gender: 'MALE',
                  icon: Icons.male,
                  isSelected: gender_selected == Gender.male ? true : false,
                  onTap: () {
                    setState(() {
                      gender_selected = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: GenderCard(
                  gender: 'FEMALE',
                  icon: Icons.female,
                  isSelected: gender_selected == Gender.female ? true : false,
                  onTap: () {
                    setState(() {
                      gender_selected = Gender.female;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: SliderCard(
              value: height,
              title: 'HEIGHT',
              unit: 'cm',
              onChanged: (val) {
                setState(() {
                  height = val.toInt();
                  print(height);
                });
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: AWCard(
                  title: 'WEIGHT',
                  value: weight,
                  onPressedMinus: () {
                    setState(() {
                      weight--;
                    });
                  },
                  onPressedPlus: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
              ),
              Expanded(
                child: AWCard(
                  title: 'AGE',
                  value: age,
                  onPressedMinus: () {
                    setState(() {
                      age--;
                    });
                  },
                  onPressedPlus: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              onTap: () {
                print('Calculate');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      gender: gender_selected,
                      height: height,
                      age: age,
                      weight: weight,
                    );
                  }),
                );
              },
              title: 'CALCULATE',
            ),
          ),
        ],
      ),
    );
  }
}
