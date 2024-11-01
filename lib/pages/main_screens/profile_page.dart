import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/meditation_exercise_model.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_mobile_app/models/sleep_exercise_model.dart';
import 'package:meditator_mobile_app/provider/custom_provider.dart';
import 'package:meditator_mobile_app/utils/colors.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Here are you custom exercises",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<CustomProvider>(
                builder: (context, data, child) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildSectionTitle("Meditations"),
                      _buildMeditationsList(
                        data.getMeditations(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      _buildSectionTitle("Mindfulness Exercise"),
                      _buildMindfulnessExerciseList(
                        data.getMindfulnessExercises(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      _buildSectionTitle("Sleep Exercise"),
                      _buildSleepExerciseList(
                        data.getSleepExercises(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // helper widget for titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBlack,
      ),
    );
  }

  // helper widget for cards
  Widget _buildContent({
    required title,
    required description,
    required duration,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          "$duration min",
          style: const TextStyle(
            color: AppColors.primaryPurple,
          ),
        ),
      ),
    );
  }

  // helper widget to display meditation exercises lists
  Widget _buildMeditationsList(
      List<MeditationExerciseModel> meditationDataList) {
    if (meditationDataList.isEmpty) {
      return const Text("No meditation created");
    } else {
      return Column(
        children: meditationDataList.map((meditation) {
          return _buildContent(
            title: meditation.name,
            description: meditation.description,
            duration: meditation.duration,
          );
        }).toList(),
      );
    }
  }

  // helper widget to display mindfulness exercises lists
  Widget _buildMindfulnessExerciseList(
      List<MindfulnessExerciseModel> mindfulnessExerciseDataList) {
    if (mindfulnessExerciseDataList.isEmpty) {
      return const Text("No mindfulness exercise created");
    } else {
      return Column(
        children: mindfulnessExerciseDataList.map((mindfulnessExercise) {
          // loop
          return _buildContent(
            title: mindfulnessExercise.name,
            description: mindfulnessExercise.description,
            duration: mindfulnessExercise.duration,
          );
        }).toList(),
      );
    }
  }

  // helper widget to display sleep exercises lists
  Widget _buildSleepExerciseList(
      List<SleepExerciseModel> sleepExerciseDataList) {
    if (sleepExerciseDataList.isEmpty) {
      return const Text("No sleep exercise created");
    } else {
      return Column(
        children: sleepExerciseDataList.map((sleepExercise) {
          // loop
          return _buildContent(
            title: sleepExercise.name,
            description: sleepExercise.description,
            duration: sleepExercise.duration,
          );
        }).toList(),
      );
    }
  }
}
