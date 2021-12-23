import 'package:flutter/material.dart';

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  double _sliderStartValue = 240.0;
  int _addRemoveStartValue = 45;

  static const inactiveColor = Colors.cyan;
  static const activeColor = Colors.blue;
  var leftColot = Colors.cyan;
  var rightColor = Colors.cyan;
  activeInactive(int data) {
    if (data == 1) {
      rightColor = inactiveColor;
      if (leftColot == inactiveColor) {
        leftColot = activeColor;
      } else {
        leftColot = inactiveColor;
      }
    }
    if (data == 2) {
      leftColot = inactiveColor;
      if (rightColor == inactiveColor) {
        rightColor = activeColor;
      } else {
        rightColor = inactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_sliderStartValue.round().toString(),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SliderTheme(
                    data: SliderThemeData(
                        overlayColor: Colors.white12,
                        thumbColor: Colors.grey.shade500,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey),
                    child: Slider(
                      value: _sliderStartValue,
                      onChanged: (double sliderValue) {
                        setState(() {
                          _sliderStartValue = sliderValue;
                        });
                      },
                      min: 0,
                      max: 500,
                      label: _sliderStartValue.round().toString(),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeInactive(1);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(color: leftColot),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeInactive(2);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(color: rightColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    _addRemoveStartValue.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            _addRemoveStartValue--;
                          });
                        },
                        hoverColor: Colors.grey,
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            _addRemoveStartValue++;
                          });
                        },
                        hoverColor: Colors.grey,
                        child: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
