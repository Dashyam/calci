import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double oldDiameter;
  final double newDiameter;
  final double diameterDifference;

  final double oldCircumference;
  final double newCircumference;
  final double circumferenceDifference;

  final double oldSidewallHeight;
  final double newSidewallHeight;
  final double sidewallHeightDifference;

  final double oldRevsPerKm;
  final double newRevsPerKm;
  final double revsPerKmDifference;

  ResultPage({
    required this.oldDiameter,
    required this.newDiameter,
    required this.diameterDifference,
    required this.oldCircumference,
    required this.newCircumference,
    required this.circumferenceDifference,
    required this.oldSidewallHeight,
    required this.newSidewallHeight,
    required this.sidewallHeightDifference,
    required this.oldRevsPerKm,
    required this.newRevsPerKm,
    required this.revsPerKmDifference,
  });

  @override
  Widget build(BuildContext context) {
    double percentageCircumferenceChange =
        (circumferenceDifference / oldCircumference) * 100;
    double percentageSidewallHeightChange =
        (sidewallHeightDifference / oldSidewallHeight) * 100;
    double percentageRevsPerKmChange =
        (revsPerKmDifference / oldRevsPerKm) * 100;

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation Results'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row for Old and New Tire Size Boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Old Tire Size',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            'Diameter: ${oldDiameter.toStringAsFixed(2)} inches'),
                        Text(
                            'Circumference: ${oldCircumference.toStringAsFixed(2)} mm'),
                        Text(
                            'Sidewall Height: ${oldSidewallHeight.toStringAsFixed(2)} mm'),
                        Text('Revs per km: ${oldRevsPerKm.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New Tire Size',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            'Diameter: ${newDiameter.toStringAsFixed(2)} inches'),
                        Text(
                            'Circumference: ${newCircumference.toStringAsFixed(2)} mm'),
                        Text(
                            'Sidewall Height: ${newSidewallHeight.toStringAsFixed(2)} mm'),
                        Text('Revs per km: ${newRevsPerKm.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                ),
              ],
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
                      'Percentage Change in Circumference: ${percentageCircumferenceChange.toStringAsFixed(2)}%'),
                  Text(
                      'Percentage Change in Sidewall Height: ${percentageSidewallHeightChange.toStringAsFixed(2)}%'),
                  Text(
                      'Percentage Change in Revs per km: ${percentageRevsPerKmChange.toStringAsFixed(2)}%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
