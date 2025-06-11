import 'package:ecoquest/character_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecoquest/quiz_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth  = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // remove backgroundColor here so your image shows through
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1) Background image
          Image.asset(
            'assets/img/background.png',      // <-- your background image
            fit: BoxFit.cover,
          ),

          // 2) Your existing content on top
          SafeArea(
            child: Column(
              children: [
                // Top Half - Text + Globe
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text Section
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.08),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'ECO',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFC1E376),
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  Text(
                                    'QUEST',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1C9A33),
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              // Taglines
                              Text(
                                'Explore Pollution,',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC1E376),
                                  fontFamily: 'Inter',
                                ),
                              ),
                              Text(
                                'Discover Solution',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1C9A33),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Globe Section
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.05),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/img/Globe.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error, size: 100, color: Colors.red);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Middle Section - Get Started Button
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 80),
                      width: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFC1E376), Color(0xFF1C9A33)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => CharacterSelection(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return FadeTransition(opacity: animation, child: child);
                              },
                              transitionDuration: Duration(milliseconds: 600),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'GET STARTED',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: screenWidth * 0.02,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                 Expanded(
                  flex: 3,
                  child: Center(
                    child: Container(
                      width: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFC1E376), Color(0xFF1C9A33)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => QuizScreen(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return FadeTransition(opacity: animation, child: child);
                              },
                              transitionDuration: Duration(milliseconds: 600),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'QUIZ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: screenWidth * 0.02,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),


                // Bottom Section - Fun Fact
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Text(
                        '“🌳 Did you know? One tree absorbs up to 48 pounds of CO₂ per year!”',
                        style: TextStyle(
                          fontSize: screenWidth * 0.015,
                          color: Colors.white54,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Inter',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
