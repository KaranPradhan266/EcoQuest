import 'package:flutter/material.dart';
import 'package:ecoquest/pollution_selection_screen.dart';
import 'package:ecoquest/globals.dart';
import 'package:ecoquest/ecoqueststartscreen.dart';

class CharacterSelection extends StatelessWidget {
  const CharacterSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF102614),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Home',
        child: const Icon(Icons.home),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => StartScreen(),
              transitionsBuilder: (_, anim, __, child) =>
                FadeTransition(opacity: anim, child: child),
              transitionDuration: const Duration(milliseconds: 500),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Text(
                'Who would you like to join you on your Eco Quest!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.03,
                  fontFamily: 'Aladdin',
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _characterCard(
                    'Leo',
                    '🌿 Leo – “Loves nature and recycling!”',
                    'assets/img/Leo/HandsFold.png',
                    screenWidth,
                    context,
                  ),
                  _characterCard(
                    'Maya',
                    '🍃 Maya – “Knows all about clean energy!”',
                    'assets/img/Maya/HandsFold.png',
                    screenWidth,
                    context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _characterCard(
    String name,
    String text,
    String imagePath,
    double screenWidth,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        // Handle character selection here
        selectedCharacter = name;
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder:
                (context, animation, secondaryAnimation) =>
                    PollutionSelection(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: Duration(milliseconds: 600), // Customize speed
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.015,
              fontFamily: 'Aladdin',
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: screenWidth * 0.35,
            height: screenWidth * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white10,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
