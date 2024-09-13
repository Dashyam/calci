import 'package:flutter/material.dart';
import 'package:madhokenterprises/main.dart';
// Make sure to import your DropdownWidget

class WheelSizeCalculatorScreen extends StatefulWidget {
  @override
  _WheelSizeCalculatorScreenState createState() =>
      _WheelSizeCalculatorScreenState();
}

class _WheelSizeCalculatorScreenState extends State<WheelSizeCalculatorScreen> {
  int oldWidth = 145; // Default values
  int oldAspectRatio = 30;
  int oldDiameter = 12;

  int newWidth = 145;
  int newAspectRatio = 30;
  int newDiameter = 12;

  List<int> getFilteredWidths() {
    return [
      for (int i = 100; i <= 295; i += 5)
        if (i % 10 != 0) i
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wheel Size Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Old Tire Size:', style: TextStyle(fontSize: 18)),
            Row(
              children: [
                Expanded(
                  child: DropdownWidget(
                    label: 'Width',
                    value: oldWidth,
                    items: getFilteredWidths(),
                    onChanged: (value) {
                      setState(() {
                        oldWidth = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownWidget(
                    label: 'Aspect Ratio',
                    value: oldAspectRatio,
                    items: [for (int i = 35; i <= 85; i += 5) i],
                    onChanged: (value) {
                      setState(() {
                        oldAspectRatio = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownWidget(
                    label: 'Diameter',
                    value: oldDiameter,
                    items: [for (int i = 12; i <= 30; i += 1) i],
                    onChanged: (value) {
                      setState(() {
                        oldDiameter = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('New Tire Size:', style: TextStyle(fontSize: 18)),
            Row(
              children: [
                Expanded(
                  child: DropdownWidget(
                    label: 'Width',
                    value: newWidth,
                    items: getFilteredWidths(),
                    onChanged: (value) {
                      setState(() {
                        newWidth = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownWidget(
                    label: 'Aspect Ratio',
                    value: newAspectRatio,
                    items: [for (int i = 35; i <= 85; i += 5) i],
                    onChanged: (value) {
                      setState(() {
                        newAspectRatio = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownWidget(
                    label: 'Diameter',
                    value: newDiameter,
                    items: [for (int i = 12; i <= 30; i += 1) i],
                    onChanged: (value) {
                      setState(() {
                        newDiameter = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
