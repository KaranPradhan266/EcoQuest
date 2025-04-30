import 'package:flutter/material.dart';

class CharacterSelection extends StatelessWidget {
  const CharacterSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF102614),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05),
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
                  _characterCard('🌿 Leo – “Loves nature and recycling!”', 'assets/img/Leo/Leo_HandsFold.png',
                      screenWidth),
                  _characterCard('🍃 Maya – “Knows all about clean energy!”', 'assets/img/Maya/Maya_HandsFold.png',
                      screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _characterCard(String name, String imagePath, double screenWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: screenWidth * 0.015,
            fontFamily:'Aladdin',
            color: Colors.white54,
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
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
