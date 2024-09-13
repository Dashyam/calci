import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wheel Size Calculator',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WheelSizeCalculatorScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          'Wheel Size Calculator',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class WheelSizeCalculatorScreen extends StatefulWidget {
  @override
  _WheelSizeCalculatorScreenState createState() =>
      _WheelSizeCalculatorScreenState();
}

class _WheelSizeCalculatorScreenState extends State<WheelSizeCalculatorScreen> {
  int oldWidth = 145; // Default values
  int oldAspectRatio = 35;
  int oldDiameter = 12;

  int newWidth = 145;
  int newAspectRatio = 35;
  int newDiameter = 12;

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
                    items: [for (int i = 145; i <= 295; i += 10) i],
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
                    items: [for (int i = 145; i <= 295; i += 10) i],
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      oldWidth: oldWidth.toDouble(),
                      oldAspectRatio: oldAspectRatio.toDouble(),
                      oldDiameter: oldDiameter.toDouble(),
                      newWidth: newWidth.toDouble(),
                      newAspectRatio: newAspectRatio.toDouble(),
                      newDiameter: newDiameter.toDouble(),
                    ),
                  ),
                );
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownWidget extends StatelessWidget {
  final String label;
  final int value;
  final List<int> items;
  final ValueChanged<int?> onChanged;

  DropdownWidget({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: value,
          onChanged: onChanged,
          isExpanded: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          items: items.map((int item) {
            return DropdownMenuItem<int>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
          // Setting a fixed height and enabling scrolling
          itemHeight: 50, // Adjust height as needed
        ),
      ],
    );
  }
}

class ResultPage extends StatelessWidget {
  final double oldWidth;
  final double oldAspectRatio;
  final double oldDiameter;
  final double newWidth;
  final double newAspectRatio;
  final double newDiameter;

  ResultPage({
    required this.oldWidth,
    required this.oldAspectRatio,
    required this.oldDiameter,
    required this.newWidth,
    required this.newAspectRatio,
    required this.newDiameter,
  });

  double calculateCircumference(
      double width, double aspectRatio, double diameter) {
    double sidewallHeight = width * (aspectRatio / 100);
    double totalDiameter = sidewallHeight * 2 + diameter * 25.4;
    return totalDiameter * 3.1416; // Circumference = π * Diameter
  }

  double calculateSidewallHeight(double width, double aspectRatio) {
    return width * (aspectRatio / 100);
  }

  double calculateRevsPerKm(double width, double aspectRatio, double diameter) {
    double circumference = calculateCircumference(width, aspectRatio, diameter);
    return 1000000 /
        circumference; // Revs per km = 1,000,000 / Circumference (in mm)
  }

  @override
  Widget build(BuildContext context) {
    double oldCircumference =
        calculateCircumference(oldWidth, oldAspectRatio, oldDiameter);
    double newCircumference =
        calculateCircumference(newWidth, newAspectRatio, newDiameter);
    double circumferenceDifference = newCircumference - oldCircumference;

    double oldSidewallHeight =
        calculateSidewallHeight(oldWidth, oldAspectRatio);
    double newSidewallHeight =
        calculateSidewallHeight(newWidth, newAspectRatio);
    double sidewallHeightDifference = newSidewallHeight - oldSidewallHeight;

    double oldRevsPerKm =
        calculateRevsPerKm(oldWidth, oldAspectRatio, oldDiameter);
    double newRevsPerKm =
        calculateRevsPerKm(newWidth, newAspectRatio, newDiameter);
    double revsPerKmDifference = newRevsPerKm - oldRevsPerKm;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Old Tire Size Box
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Old Tire Size',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Width: $oldWidth mm'),
                  Text('Aspect Ratio: $oldAspectRatio %'),
                  Text('Diameter: $oldDiameter inch'),
                  Text(
                      'Circumference: ${oldCircumference.toStringAsFixed(2)} mm'),
                  Text(
                      'Sidewall Height: ${oldSidewallHeight.toStringAsFixed(2)} mm'),
                  Text('Revs per km: ${oldRevsPerKm.toStringAsFixed(2)}'),
                ],
              ),
            ),
            SizedBox(height: 16),
            // New Tire Size Box
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('New Tire Size',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Width: $newWidth mm'),
                  Text('Aspect Ratio: $newAspectRatio %'),
                  Text('Diameter: $newDiameter inch'),
                  Text(
                      'Circumference: ${newCircumference.toStringAsFixed(2)} mm'),
                  Text(
                      'Sidewall Height: ${newSidewallHeight.toStringAsFixed(2)} mm'),
                  Text('Revs per km: ${newRevsPerKm.toStringAsFixed(2)}'),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Difference Box
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Difference',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(
                      'Circumference Difference: ${circumferenceDifference.toStringAsFixed(2)} mm'),
                  Text(
                      'Sidewall Height Difference: ${sidewallHeightDifference.toStringAsFixed(2)} mm'),
                  Text(
                      'Revs per km Difference: ${revsPerKmDifference.toStringAsFixed(2)}'),
                  Text(
                      'Percentage Change in Circumference: ${((circumferenceDifference / oldCircumference) * 100).toStringAsFixed(2)}%'),
                  Text(
                      'Percentage Change in Sidewall Height: ${((sidewallHeightDifference / oldSidewallHeight) * 100).toStringAsFixed(2)}%'),
                  Text(
                      'Percentage Change in Revs per km: ${((revsPerKmDifference / oldRevsPerKm) * 100).toStringAsFixed(2)}%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
