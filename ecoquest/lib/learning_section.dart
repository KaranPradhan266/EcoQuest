import 'package:ecoquest/globals.dart';
import 'package:flutter/material.dart';

class LearningSection extends StatefulWidget {
  const LearningSection({super.key});

  @override
  State<LearningSection> createState() => _LearningSectionState();
}

class _LearningSectionState extends State<LearningSection>
    with SingleTickerProviderStateMixin {
  int page = 1;
  int tab = 1;
  bool isEnglish = true;
  String currentText = '';
  double scale = 0.0;

  // English and Spanish data
  final List<List<String>> airENG = [
    [
      "Welcome! Kiddo, Let's unravel the truth of Air pollution!",
      "Air pollution is when harmful substances fill the air we breathe.",
      "Let’s go down and explore the city!",
    ],
    [
      "See all that traffic? Those car fumes add a lot of dirty gases to the air.",
      "Vehicles release gases like carbon monoxide and nitrogen oxides.",
      "This is called transport pollution – one of the biggest contributors!",
      "Well done! You’re learning fast!",
      "But that's not the only villain in our story!",
      "Look over there… see that factory with smoke coming out of its chimney?",
    ],
    [
      "Factories burn fuel and release gases like sulfur dioxide and particulate matter.",
      "This kind of pollution is called industrial pollution.",
      "Let’s tap the smoke cloud to learn more!",
    ]
  ];

  final List<List<String>> airSPA = [
    [
      "¡Bienvenidos, pequeños! ¡Descubramos la verdad sobre la contaminación del aire!",
      "La contaminación del aire se produce cuando sustancias nocivas llenan el aire que respiramos.",
      "¡Bajemos y exploremos la ciudad!",
    ],
    [
      "¿Ves todo ese tráfico? El humo de los coches contamina el aire con muchos gases.",
      "Los vehículos liberan gases como monóxido de carbono y óxidos de nitrógeno.",
      "Esto se llama contaminación del transporte, ¡y es uno de los mayores contribuyentes!",
      "¡Bien hecho! ¡Estás aprendiendo rápido!",
      "¡Pero esa no es la única villana en nuestra historia!",
      "Mira allá… ¿Ves aquella fábrica con humo saliendo de la chimenea?",
    ],
    [
      "Las fábricas queman combustible y liberan gases como dióxido de azufre y partículas.",
      "Este tipo de contaminación se llama contaminación industrial.",
      "¡Toquemos la nube de humo para obtener más información!",
    ]
  ];

  // Getter for currently selected data
  List<List<String>> get currentData => isEnglish ? airENG : airSPA;

  @override
  void initState() {
    super.initState();
    // Initialize with first text
    currentText = currentData[0][0];
    // Pop-in animation
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => scale = 1.0);
    });
  }

  // Advance to next text in sequence
  void updateText() {
    setState(() => scale = 0.0);
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        final data = currentData;
        if (page - 1 < data.length && tab < data[page - 1].length) {
          currentText = data[page - 1][tab];
          tab++;
        } else {
          page++;
          if (page <= data.length) {
            tab = 1;
            currentText = data[page - 1][0];
          } else {
            currentText =
                isEnglish ? "That's all for now!" : "¡Eso es todo por ahora!";
          }
        }
        scale = 1.0;
      });
    });
  }

  // Toggle between English and Spanish
  void toggleLanguage() {
    setState(() {
      isEnglish = !isEnglish;
      final data = currentData;
      // Safely update current text to the same position
      if (page - 1 < data.length && tab - 1 < data[page - 1].length) {
        currentText = data[page - 1][tab - 1];
      } else {
        // Fallback to first entry
        page = 1;
        tab = 1;
        currentText = data[0][0];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Next button
            FloatingActionButton(
              onPressed: updateText,
              tooltip: 'Next',
              child: const Icon(Icons.arrow_forward),
            ),

            const SizedBox(width: 12),

            // Language toggle button (mini)
            FloatingActionButton(
              onPressed: toggleLanguage,
              tooltip: isEnglish ? 'Ver en Español' : 'View in English',
              child: Icon(
                Icons.language,
                color: isEnglish ? Colors.blueAccent : Colors.teal,
              ),
            ),
          ],
        ),
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
                  duration: const Duration(milliseconds: 400),
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
                            style: const TextStyle(
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

            // Tail with animated scale
            Positioned(
              top: screenHeight * 0.40,
              left: screenWidth * 0.48,
              width: screenWidth * 0.08,
              child: AnimatedScale(
                scale: scale,
                duration: const Duration(milliseconds: 400),
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
