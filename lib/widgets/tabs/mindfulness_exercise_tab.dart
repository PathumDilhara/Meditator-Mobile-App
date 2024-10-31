import 'package:flutter/material.dart';

class MindfulnessExerciseTab extends StatelessWidget {
  const MindfulnessExerciseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Text(
              "Mindfulness exercises",
            ),
          ),
        ],
      ),
    );
  }
}
