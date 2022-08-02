import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.gender,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final IconData icon;
  final String gender;
  final onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? cCardPrimaryBGColorSelected : cCardPrimaryBGColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              size: 70,
            ),
            SizedBox(height: 2),
            Text(
              this.gender,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AWCard extends StatelessWidget {
  const AWCard({
    Key? key,
    this.title = '',
    this.value = 0,
    required this.onPressedMinus,
    required this.onPressedPlus,
  }) : super(key: key);
  final String title;
  final int value;
  final onPressedMinus;
  final onPressedPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(34, 148, 138, 138),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            '${this.value}',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonRound(text: '-', onPressed: this.onPressedMinus),
              ButtonRound(text: '+', onPressed: this.onPressedPlus),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonRound extends StatelessWidget {
  const ButtonRound({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: RawMaterialButton(
        onPressed: this.onPressed,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            this.text,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        shape: CircleBorder(),
        fillColor: Colors.white54,
      ),
    );
  }
}

class SliderCard extends StatelessWidget {
  const SliderCard({
    Key? key,
    required this.onChanged,
    this.title = '',
    this.unit = '',
    this.value = 0,
  }) : super(key: key);

  final onChanged;
  final String title;
  final String unit;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(34, 148, 138, 138),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${this.value}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              Text(
                this.unit,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Color.fromARGB(255, 235, 23, 94),
              inactiveTrackColor: Colors.white54,
              thumbColor: Color.fromARGB(255, 235, 23, 94),
              overlayColor: Colors.white54,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 7.0,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 10.0,
              ),
            ),
            child: Slider(
              value: this.value.toDouble(),
              min: 0.0,
              max: 250.0,
              onChanged: this.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: 10,
        color: Color.fromARGB(255, 168, 11, 63),
        margin: EdgeInsets.only(
          top: 5.0,
        ),
        padding: EdgeInsets.only(bottom: 5.0),
        child: Center(
          child: Text(
            'CALCULATE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
