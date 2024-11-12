import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TireVisual extends StatelessWidget {
  final double oldWidth;
  final double oldAspectRatio;
  final double oldDiameter;
  final double newWidth;
  final double newAspectRatio;
  final double newDiameter;

  TireVisual({
    Key? key,
    required this.oldWidth,
    required this.oldAspectRatio,
    required this.oldDiameter,
    required this.newWidth,
    required this.newAspectRatio,
    required this.newDiameter,
  }) : super(key: key);

  double calculateInnerDiameter(double outerDiameter, double aspectRatio) {
    double sidewallThickness = (outerDiameter * (aspectRatio / 100) * 0.3);
    return outerDiameter - (2 * sidewallThickness);
  }

  double calculateSidewallThickness(double width, double aspectRatio) {
    return width * (aspectRatio / 100);
  }

  @override
  Widget build(BuildContext context) {
    const double maxDisplaySize = 180;

    return Container(
      padding: const EdgeInsets.all(5),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                const Text('Old Tire', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28)),
                Text('${oldWidth.toInt()} / ${oldAspectRatio.toInt()} / ${oldDiameter.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  width: maxDisplaySize,
                  height: maxDisplaySize,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double outerDiameter = constraints.maxHeight;
                      double innerDiameter = calculateInnerDiameter(outerDiameter, oldAspectRatio);
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          //Container 1
                          Container(
                            width: outerDiameter,
                            height: outerDiameter,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(148, 0, 0, 0)
                            ),
                          ),
                           //Container 2
                          Container(
                            width: outerDiameter - ( outerDiameter * 0.10) ,
                            height: outerDiameter -( outerDiameter * 0.10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(160, 0, 0, 0)
                            ),
                          ),
                           //Container 3
                          Container(
                            width: outerDiameter - ( outerDiameter * 0.30),
                            height: outerDiameter - ( outerDiameter * 0.30),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(166, 119, 118, 118)
                            ),
                          ),
                           //Container 4
                          Container(
                            width: innerDiameter > 0 ? innerDiameter : 0,
                            height: innerDiameter > 0 ? innerDiameter : 0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [Colors.white, Colors.grey[200]!],
                                center: Alignment(0.3, 0.3),
                                radius: 1.2,
                              ),
                            ),
                          ),ClipOval(
                            child: Image.asset('assets/wheel.png', height: innerDiameter, width: innerDiameter),),
                          

                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                ],
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              children: [
                const Text('New Tire', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28)),
                 Text('${newWidth.toInt()} / ${newAspectRatio.toInt()} / ${newDiameter.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  width: maxDisplaySize,
                  height: maxDisplaySize,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double outerDiameter = constraints.maxHeight;
                      double innerDiameter = calculateInnerDiameter(outerDiameter, newAspectRatio);
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: outerDiameter,
                            height: outerDiameter,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(148, 0, 0, 0)
                            ),
                          ),
                          Container(
                            width: outerDiameter - (outerDiameter * 0.10),
                            height: outerDiameter - (outerDiameter * 0.10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(160, 0, 0, 0)
                            ),
                          ),
                          Container(
                            width: outerDiameter - (outerDiameter * 0.30),
                            height: outerDiameter - (outerDiameter * 0.30),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(166, 119, 118, 118)
                            ),
                          ),
                          Container(
                            width: innerDiameter > 0 ? innerDiameter : 0,
                            height: innerDiameter > 0 ? innerDiameter : 0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [Colors.white, Colors.grey[200]!],
                                center: Alignment(0.3, 0.3),
                                radius: 1.2,
                              ),
                            ),
                          ),
                          ClipOval(
                            child: Image.asset('assets/wheel.png', height: innerDiameter, width: innerDiameter),),
                            
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
