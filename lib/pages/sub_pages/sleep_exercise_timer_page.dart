import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/sleep_exercise_model.dart';
import 'package:meditator_mobile_app/utils/colors.dart';

class SleepExerciseTimerPage extends StatefulWidget {
  final SleepExerciseModel sleepExerciseModel;
  const SleepExerciseTimerPage({
    super.key,
    required this.sleepExerciseModel,
  });

  @override
  State<SleepExerciseTimerPage> createState() => _SleepExerciseTimerPageState();
}

class _SleepExerciseTimerPageState extends State<SleepExerciseTimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sleep Story Timer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sleepExerciseModel.category,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.sleepExerciseModel.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Duration : ${widget.sleepExerciseModel.category} minutes",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.sleepExerciseModel.description,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
