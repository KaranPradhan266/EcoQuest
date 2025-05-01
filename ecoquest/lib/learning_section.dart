import 'package:ecoquest/globals.dart';
import 'package:flutter/material.dart';

class LearningSection extends StatefulWidget {
  const LearningSection({super.key});

  @override
  State<LearningSection> createState() => _LearningSectionState();
}

class _LearningSectionState extends State<LearningSection>
    with SingleTickerProviderStateMixin {
  int tab = 1;
  String currentText = 'Hi, Thanks for choosing me!';
  double scale = 0.0;

  List<List<String>> data = [
    ["Welcome! Kiddo, Let\'s unravel the truth of Air pollution!", 
    "Air pollution is when harmful substances fill the air we breathe.",
    "Let’s go down and explore the city!",
    ],

    [
      "See all that traffic? Those car fumes add a lot of dirty gases to the air.",
      "Vehicles release gases like carbon monoxide and nitrogen oxides.",
     "This is called transport pollution – one of the biggest contributors!",
     "Well done! You’re learning fast!",
     "But that's not the only villain in our story!",
     "Look over there… see that factory with smoke coming out of its chimney?"
     ],

     [
      "Factories burn fuel and release gases like sulfur dioxide and particulate matter.",
      "This kind of pollution is called industrial pollution.",
      "Let’s tap the smoke cloud to learn more!"
     ]
  ];

  @override
  void initState() {
    super.initState();
    // Initial pop
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() => scale = 1.0);
    });
  }

  void updateText() {
    setState(() {
      scale = 0.0; // shrink before updating text
    });

    Future.delayed(Duration(milliseconds: 50), () {
      setState(() {
        // Safety check to avoid index out of range
      if (page - 1 < data.length && tab < data[page - 1].length) {
        currentText = data[page - 1][tab];
        tab++;
      } else {
        // Move to next page if available
        page++;
        if (page < data.length) {
          tab = 0;
          currentText = data[page - 1][tab];
          tab++;
        } else {
          currentText = "That's all for now!";
        }
      }

      scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: updateText,
        child: Icon(Icons.arrow_forward),
        tooltip: 'Next',
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/img/Learning/$learningSection/$selectedCharacter/$page.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Cloud body with animated scale
            Positioned(
              top: screenHeight * 0.18,
              left: screenWidth * 0.52,
              width: screenWidth * 0.35,
              child: AspectRatio(
                aspectRatio: 1.6,
                child: AnimatedScale(
                  scale: scale,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeOutBack,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/img/cloud_body.png',
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            currentText,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Tail with animated scale too
            Positioned(
              top: screenHeight * 0.40,
              left: screenWidth * 0.48,
              width: screenWidth * 0.08,
              child: AnimatedScale(
                scale: scale,
                duration: Duration(milliseconds: 400),
                curve: Curves.easeOutBack,
                child: Image.asset(
                  'assets/img/cloud_tail.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
