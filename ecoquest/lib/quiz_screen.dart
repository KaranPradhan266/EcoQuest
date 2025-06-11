import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:ecoquest/ecoqueststartscreen.dart';
import 'dart:math';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  bool _answered = false;
  String _selectedOption = '';
  bool _isSpanish = false;
  int _score = 0;
  late ConfettiController _confettiController;

  final List<Map<String, Object>> _questions = [
    {
      'question_en': 'What is a major cause of air pollution?',
      'question_es':
          '¿Cuál es una causa principal de la contaminación del aire?',
      'options_en': ['Trees', 'Factories', 'Rain', 'Mountains'],
      'options_es': ['Árboles', 'Fábricas', 'Lluvia', 'Montañas'],
      'answer_en': 'Factories',
      'answer_es': 'Fábricas',
    },
    {
      'question_en': 'What gas do cars release that pollutes the air?',
      'question_es': '¿Qué gas liberan los autos que contamina el aire?',
      'options_en': ['Oxygen', 'Carbon Dioxide', 'Hydrogen', 'Nitrogen'],
      'options_es': ['Oxígeno', 'Dióxido de carbono', 'Hidrógeno', 'Nitrógeno'],
      'answer_en': 'Carbon Dioxide',
      'answer_es': 'Dióxido de carbono',
    },
    {
      'question_en': 'Which of these helps reduce pollution?',
      'question_es': '¿Cuál de estos ayuda a reducir la contaminación?',
      'options_en': [
        'Throwing trash',
        'Riding bikes',
        'Burning plastic',
        'Cutting trees',
      ],
      'options_es': [
        'Tirar basura',
        'Andar en bicicleta',
        'Quemar plástico',
        'Cortar árboles',
      ],
      'answer_en': 'Riding bikes',
      'answer_es': 'Andar en bicicleta',
    },
    {
      'question_en': 'What should we not throw in rivers?',
      'question_es': '¿Qué no debemos arrojar en los ríos?',
      'options_en': ['Trash', 'Fish', 'Water', 'Leaves'],
      'options_es': ['Basura', 'Peces', 'Agua', 'Hojas'],
      'answer_en': 'Trash',
      'answer_es': 'Basura',
    },
    {
      'question_en': 'Which of these pollutes the ocean?',
      'question_es': '¿Cuál de estos contamina el océano?',
      'options_en': ['Plastic waste', 'Rainwater', 'Seaweed', 'Sunlight'],
      'options_es': [
        'Desechos plásticos',
        'Agua de lluvia',
        'Algas marinas',
        'Luz solar',
      ],
      'answer_en': 'Plastic waste',
      'answer_es': 'Desechos plásticos',
    },
    {
      'question_en': 'What color bin is usually for recycling?',
      'question_es': '¿De qué color es normalmente el contenedor de reciclaje?',
      'options_en': ['Red', 'Blue', 'Black', 'Yellow'],
      'options_es': ['Rojo', 'Azul', 'Negro', 'Amarillo'],
      'answer_en': 'Blue',
      'answer_es': 'Azul',
    },
    {
      'question_en': 'Which energy is clean and renewable?',
      'question_es': '¿Qué energía es limpia y renovable?',
      'options_en': ['Coal', 'Wind', 'Gasoline', 'Diesel'],
      'options_es': ['Carbón', 'Viento', 'Gasolina', 'Diésel'],
      'answer_en': 'Wind',
      'answer_es': 'Viento',
    },
    {
      'question_en': 'What should we do with paper to reduce waste?',
      'question_es': '¿Qué debemos hacer con el papel para reducir residuos?',
      'options_en': ['Burn it', 'Recycle it', 'Throw it away', 'Ignore it'],
      'options_es': ['Quemarlo', 'Reciclarlo', 'Tirarlo', 'Ignorarlo'],
      'answer_en': 'Recycle it',
      'answer_es': 'Reciclarlo',
    },
    {
      'question_en':
          'What is the best way to travel short distances without polluting?',
      'question_es':
          '¿Cuál es la mejor manera de viajar distancias cortas sin contaminar?',
      'options_en': [
        'Drive a car',
        'Ride a bike',
        'Take a plane',
        'Use a boat',
      ],
      'options_es': [
        'Conducir un coche',
        'Andar en bicicleta',
        'Tomar un avión',
        'Usar un bote',
      ],
      'answer_en': 'Ride a bike',
      'answer_es': 'Andar en bicicleta',
    },
    {
      'question_en': 'What do plants do to help the air?',
      'question_es': '¿Qué hacen las plantas para ayudar al aire?',
      'options_en': ['Make it dirty', 'Produce smoke', 'Clean it', 'Block it'],
      'options_es': ['Ensuciarlo', 'Producir humo', 'Limpiarlo', 'Bloquearlo'],
      'answer_en': 'Clean it',
      'answer_es': 'Limpiarlo',
    },
  ];

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _selectOption(String option) {
    if (_answered) return;

    final correctAnswer =
        _isSpanish
            ? _questions[_questionIndex]['answer_es']
            : _questions[_questionIndex]['answer_en'];

    setState(() {
      _answered = true;
      _selectedOption = option;
      if (option == correctAnswer) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex++;
        _answered = false;
        _selectedOption = '';
      });
    } else {
      _confettiController.play();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (ctx) => AlertDialog(
              title: Text(_isSpanish ? '¡Completado!' : 'Completed!'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isSpanish
                        ? 'Tu puntuación es $_score de ${_questions.length}'
                        : 'Your score is $_score out of ${_questions.length}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirection: pi / 2,
                      emissionFrequency: 0.05,
                      numberOfParticles: 30,
                      gravity: 0.2,
                      shouldLoop: false,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    setState(() {
                      _questionIndex = 0;
                      _answered = false;
                      _selectedOption = '';
                      _score = 0;
                    });
                  },
                  child: Text(_isSpanish ? 'Reiniciar' : 'Restart'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _questionIndex = 0;
                      _answered = false;
                      _selectedOption = '';
                      _score = 0;
                    });
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => StartScreen(),
                        transitionsBuilder:
                            (_, anim, __, child) =>
                                FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 500),
                      ),
                    );
                  },
                  child: Text(_isSpanish ? 'Hogar' : 'Home'),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = _questions[_questionIndex];
    final question =
        _isSpanish ? current['question_es'] : current['question_en'];
    final options =
        _isSpanish
            ? current['options_es'] as List<String>
            : current['options_en'] as List<String>;
    final answer = _isSpanish ? current['answer_es'] : current['answer_en'];

    return Scaffold(
      appBar: AppBar(
        title: Text(_isSpanish ? 'EcoCuestionario' : 'EcoQuiz'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              setState(() {
                _isSpanish = !_isSpanish;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_isSpanish ? 'Pregunta' : 'Question'} ${_questionIndex + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              question.toString(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...options.map((option) {
              Color color = Colors.blue.shade100;
              if (_answered) {
                if (option == answer) {
                  color = Colors.green.shade300;
                } else if (option == _selectedOption) {
                  color = Colors.red.shade300;
                }
              }

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () => _selectOption(option),
                  child: Text(option, style: const TextStyle(fontSize: 18)),
                ),
              );
            }),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: _answered ? _nextQuestion : null,
                child: Text(_isSpanish ? 'Siguiente' : 'Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
