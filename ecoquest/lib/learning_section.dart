import 'package:ecoquest/globals.dart';
import 'package:flutter/material.dart';
import 'package:ecoquest/pollution_selection_screen.dart';
import 'package:audioplayers/audioplayers.dart';

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

 // Audio player
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;

 @override
  void initState() {
    super.initState();
    // Initialize audio player
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
    });

    // Initialize with first text
    currentText = currentData[0][0];
    // Pop-in animation
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => scale = 1.0);
    });
  }
  

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
      "Factories burn fuel and release gases like sulfur dioxide and particulate matter.",
      "This kind of pollution is called industrial pollution.",
      "Let’s tap the smoke cloud to learn more!",
    ],
  ];

    final List<List<String>> waterENG = [
  [
    "Welcome! Kiddo, let’s dive into the world of Water pollution!",
    "Water pollution is when harmful substances contaminate our lakes, rivers, and oceans.",
    "Grab your snorkel and let’s explore the shoreline!",
  ],
  [
    "See all that plastic floating by? Every year, millions of tons of plastic waste end up in water bodies.",
    "Plastic breaks down into microplastics that harm fish, birds, and even us when we drink water.",
    "This is called plastic pollution – a major culprit in water contamination!",
    "But that’s not all… look over there at those pipes leading into the stream!",
    "Factories and farms release dirty water filled with chemicals and fertilizer runoff.",
    "This kind of pollution is called industrial and agricultural runoff.",
    "Tap the water droplet to learn how we can clean it up!",
  ],
];

final List<List<String>> soilENG = [
  [
    "Welcome! Kiddo, let’s dig into the mystery of Soil pollution!",
    "Soil pollution happens when harmful substances make our ground dirty and unsafe.",
    "Put on your explorer boots—let’s investigate the earth beneath our feet!",
  ],
  [
    "See all that trash on the ground? Plastic bags, cans, and old electronics can poison the soil.",
    "Toxins like lead and mercury from batteries and e-waste seep deep into the earth.",
    "This is called solid waste pollution – one of the toughest soil villains!",
  ],
  [
    "But that’s not all… look at those yellowing plants over there.",
    "Pesticides and chemical spills can kill beneficial bugs and plants in the soil.",
    "This kind of pollution is called chemical contamination.",
    "Tap the little earthworm to learn how we can restore healthy, fertile soil!",
    "You’re doing fantastic—our Earth’s future looks brighter with you on the case!",
  ],
];


   final List<List<String>> waterSPA = [
  [
    "¡Bienvenidos! ¡Chiquillos, adentrémonos en el mundo de la contaminación del agua!",
    "La contaminación del agua se produce cuando sustancias nocivas contaminan nuestros lagos, ríos y océanos.",
    "¡Toma tu snorkel y exploremos la costa!",
  ],
  [
    "¿Ves todo ese plástico flotando? Cada año, millones de toneladas de residuos plásticos acaban en los cuerpos de agua.",
    "El plástico se descompone en microplásticos que dañan a los peces, a las aves e incluso a nosotros cuando bebemos agua.",
    "Esto se llama contaminación plástica: ¡uno de los principales culpables de la contaminación del agua!",
    "Pero eso no es todo… ¡mira allá esas tuberías que conducen al arroyo!",
    "Las fábricas y las granjas liberan agua sucia llena de productos químicos y fertilizantes.",
    "Este tipo de contaminación se denomina escorrentía industrial y agrícola.",
    "Toque la gota de agua para aprender cómo podemos limpiarla!",
  ],
];

final List<List<String>> soilSPA = [
  [
    "¡Bienvenidos! ¡Chiquillos, adentrémonos en el misterio de la contaminación del suelo!",
    "La contaminación del suelo ocurre cuando sustancias nocivas hacen que nuestro suelo sea sucio y peligroso.",
    "Ponte tus botas de explorador: ¡investiguemos la tierra bajo nuestros pies!",
  ],
  [
    "¿Ves toda esa basura en el suelo? Las bolsas de plástico, las latas y los aparatos electrónicos viejos pueden contaminar el suelo.",
    "Las toxinas como el plomo y el mercurio de las baterías y los desechos electrónicos se filtran profundamente en la tierra.",
    "Esto se llama contaminación por residuos sólidos: ¡uno de los villanos más duros del suelo!",
    "Pero eso no es todo… mira esas plantas amarillentas allí.",
    "Los pesticidas y los derrames de productos químicos pueden matar insectos y plantas beneficiosas en el suelo.",
    "Este tipo de contaminación se llama contaminación química.",
    "¡Toca la pequeña lombriz de tierra para aprender cómo podemos restaurar un suelo fértil y saludable!",
    "¡Lo estás haciendo fantástico! ¡El futuro de nuestra Tierra luce más brillante contigo en el caso!",
  ],
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
    ],
  ];

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // Play or pause current section audio
  Future<void> _toggleAudio() async {
    final assetPath = 'audio/Mountains.mp3';
    if (_isPlaying) {
      await _audioPlayer.pause();
      setState(() => _isPlaying = false);
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(assetPath));
      setState(() => _isPlaying = true);
    }
  }

  // Getter for currently selected data
List<List<String>> get currentData {
  switch (learningSection) {
    case 'Water':
      return isEnglish ? waterENG : waterSPA;
    case 'Soil':
      return isEnglish ? soilENG   : soilSPA;
    case 'Air':
    default:
      return isEnglish ? airENG    : airSPA;
  }
}

  // Advance to next text in sequence
  void updateText() {
    setState(() => scale = 0.0);
    isEnglish = true;
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
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const PollutionSelection()));
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
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),

     floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
floatingActionButton: Padding(
  padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    // spread the three buttons evenly
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      FloatingActionButton(
        onPressed: updateText,
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward),
        
      ),
       const SizedBox(width: 5),
      FloatingActionButton(
        onPressed: toggleLanguage,
        tooltip: isEnglish ? 'Ver en Español' : 'View in English',
        child: Icon(
          Icons.language,
          color: isEnglish ? Colors.blueAccent : Colors.teal,
        ),
      ),
      const SizedBox(width: 5),
      FloatingActionButton(
        onPressed: _toggleAudio,
        tooltip: _isPlaying ? 'Pause Audio' : 'Play Audio',
        child: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
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
