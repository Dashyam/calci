import 'package:flutter/material.dart';
import 'package:madhokenterprises/screens/resultPage.dart';
import 'package:madhokenterprises/widgets/dropdown_widget.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Wheel Size Calculator', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32),),
      ),
      body: Padding(

        //Main Padding Widget

        padding: const EdgeInsets.all(16.0),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  const Text("Old Tire Size:", style: TextStyle(fontSize: 28,color: Colors.white, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
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
                  ),
                  const SizedBox(height: 16),
                  const Text('New Tire Size:', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
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
                  )
                ],
              ),
            ),
              const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
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
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Colors.grey),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ))
                  ),
                child: const Text('Calculate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),),
              ),
            ),
             const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
