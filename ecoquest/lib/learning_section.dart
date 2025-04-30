import 'package:ecoquest/globals.dart';
import 'package:flutter/material.dart';

class LearningSection extends StatelessWidget {
  const LearningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Student decided to learn: $learningSection and current page is $page');
  }
}