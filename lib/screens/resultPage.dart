import 'package:flutter/material.dart';
import 'package:madhokenterprises/screens/tires.dart';

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
        title: const Text('Result', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(
                builder: (context)=>Tires(
                  oldWidth: oldWidth, 
                  oldAspectRatio: oldAspectRatio, 
                  oldDiameter: oldDiameter, 
                  newWidth: newWidth, 
                  newAspectRatio: newAspectRatio, 
                  newDiameter: newDiameter)));
            },
        icon: const Icon(Icons.tire_repair))],      
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 215,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 97, 87, 73),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Old Tire Size', textAlign: TextAlign.center ,
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text("Width: $oldWidth mm", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text("Aspect Ratio: $oldAspectRatio %", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Diameter: $oldDiameter inch', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Circumference: ${oldCircumference.toStringAsFixed(2)} mm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Sidewall Height: ${oldSidewallHeight.toStringAsFixed(2)} mm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Revs per km: ${oldRevsPerKm.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Container(
                    height: 215,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 97, 87, 73),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('New Tire Size',
                            style:
                              TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white)),
                        Text('Width: $newWidth mm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Aspect Ratio: $newAspectRatio %',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Diameter: $newDiameter inch',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text(
                          'Circumference: ${newCircumference.toStringAsFixed(2)} mm',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text(
                          'Sidewall Height: ${newSidewallHeight.toStringAsFixed(2)} mm',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Revs per km: ${newRevsPerKm.toStringAsFixed(2)}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Difference Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:  Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child:  Text('Difference',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        ),
                        Text(
                            'Circumference Difference: ${circumferenceDifference.toStringAsFixed(2)} mm'
                            , style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),),
                        Text(
                            'Sidewall Height Difference: ${sidewallHeightDifference.toStringAsFixed(2)} mm', style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            )),
                        Text(
                            'Revs per km Difference: ${revsPerKmDifference.toStringAsFixed(2)}', style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            )),
                        Text(
                            'Percentage Change in Circumference: ${((circumferenceDifference / oldCircumference) * 100).toStringAsFixed(2)}%', style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            )),
                        Text(
                            'Percentage Change in Sidewall Height: ${((sidewallHeightDifference / oldSidewallHeight) * 100).toStringAsFixed(2)}%', style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            )),
                        Text(
                            'Percentage Change in Revs per km: ${((revsPerKmDifference / oldRevsPerKm) * 100).toStringAsFixed(2)}%', style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}