import 'package:ecoquest/learning_section.dart';
import 'package:flutter/material.dart';
import 'package:ecoquest/globals.dart';

class PollutionSelection extends StatelessWidget {
  const PollutionSelection({super.key});

  void navigateToNext(BuildContext context, String section) {
    learningSection = section;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LearningSection(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 1000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF102614),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Central Guide Character
          Positioned(
            bottom: screenHeight * 0.1,
            child: Column(
              children: [
                Image.asset(
                  'assets/img/$selectedCharacter/HandsOpen.png',
                  height: screenHeight * 0.55,
                ),
              ],
            ),
          ),

          // Air Pollution Button
          Positioned(
            left: screenWidth * 0.25,
            top: screenHeight * 0.25,
            child: GestureDetector(
              onTap: () => navigateToNext(context, 'Air'),
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/Air.png',
                    height: screenHeight * 0.14,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '☁️ Sky Mission:\n"Truth of Air Pollution"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Aladdin',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Soil Pollution Button
          Positioned(
            top: screenHeight * 0.10,
            child: GestureDetector(
              onTap: () => navigateToNext(context, 'Soil'),
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/land.png',
                    height: screenHeight * 0.14,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '🟢 Soil Seekers:\n"Digging into Pollution"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Aladdin',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Water Pollution Button
          Positioned(
            right: screenWidth * 0.25,
            top: screenHeight * 0.25,
            child: GestureDetector(
              onTap: () => navigateToNext(context, 'Water'),
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/water.png',
                    height: screenHeight * 0.14,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '💧 Aqua Detectives:\n"Pollution on the Case"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Aladdin',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
