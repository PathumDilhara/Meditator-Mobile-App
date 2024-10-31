import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/widgets/tabs/meditation_tab.dart';
import 'package:meditator_mobile_app/widgets/tabs/mindfulness_exercise_tab.dart';
import 'package:meditator_mobile_app/widgets/tabs/sleep_exercise_tab.dart';

class CustomExercisesPage extends StatelessWidget {
  const CustomExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your exercises"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Meditation",
              ),
              Tab(
                text: "Sleep Execises",
              ),
              Tab(
                text: "Mindfullness Exercises",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MeditationTab(),
            SleepExerciseTab(),
            MindfulnessExerciseTab(),
          ],
        ),
      ),
    );
  }
}
