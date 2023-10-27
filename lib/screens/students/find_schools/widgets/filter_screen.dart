import 'package:flutter/material.dart';

//filter screen
class filterScreen extends StatefulWidget {
  final Function(double) callback;
  final Function resetCallback;
  const filterScreen(
      {super.key, required this.callback, required this.resetCallback});

  @override
  State<filterScreen> createState() => _filterScreenState();
}

class _filterScreenState extends State<filterScreen> {
  double sliderValue = 0;

  void onSliderValueReceived(double data) {
    // Process the data received from the child widget.
    setState(() {
      sliderValue = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //close button
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            //title
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.tune,
                  color: Colors.black,
                  size: 30.0,
                ),
                SizedBox(width: 5.0),
                Text(
                  "Filter",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //body
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //text1
                  Text(
                    "Filter by distance",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),

                  //text2
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "You can filter nearest driving schools upto 10KM",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  //slider
                  Container(
                      child: SliderExample(callback: onSliderValueReceived)),
                  SizedBox(height: 10.0),
                  //2 button

                  MaterialButton(
                    onPressed: () {
                      widget.callback(sliderValue);
                      Navigator.of(context).pop();
                    },
                    minWidth: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    color: Colors.indigo.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      "Apply",
                      style: TextStyle(color: Colors.white, fontSize: 16.00),
                    ),
                  ),
                  SizedBox(height: 10.0),

                  MaterialButton(
                    onPressed: () {
                      widget.resetCallback(); // Call the reset function
                      Navigator.of(context).pop();
                    },
                    minWidth: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.white, fontSize: 16.00),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


//slider
class SliderExample extends StatefulWidget {
  final Function(double) callback;
  const SliderExample({super.key, required this.callback});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 4;

  double get sliderValue => _currentSliderValue;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 10,
      divisions: 10,
      activeColor: Colors.amber,
      label: _currentSliderValue.round().toString() + "KM",
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
          widget.callback(_currentSliderValue);
        });
      },
    );
  }
}

