import 'package:flutter/material.dart';

class CharacterSelection extends StatelessWidget {
  const CharacterSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF102614),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex:1, 
              child: 
              Padding(
              padding: EdgeInsets.only(top: screenWidth * 0.05),
              child:
                Text('Who would you like to join you on your Eco Quest!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.02,
                    fontFamily: 'Aladdin',
                  ),
                ),
            ),
            ),
            Expanded(
              flex:3, 
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/img/Leo/Leo_HandsFold.png'),
                  Image.asset('assets/img/Maya/Maya_HandsFold.png'),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}