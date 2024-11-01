import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          title: const Text("Your exercises"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Meditation",
              ),
              Tab(
                text: "Sleep Exercises",
              ),
              Tab(
                text: "Mindfulness Exercises",
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).push("/create");
          },
          child: const Icon(Icons.add),
        ),
        body: const TabBarView(
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
