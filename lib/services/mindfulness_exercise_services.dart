import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';

import '../utils/colors.dart';

class MindfulnessExerciseServices {
  var mindfulnessBox = Hive.box("mindfulness_data_box");

  // Method to add a new mindfulness exercise
  Future<void> addMindfulnessExercise(
      MindfulnessExerciseModel mindfulnessExercise,
      BuildContext context) async {
    try {
      final allMindfulExercises = mindfulnessBox.get("mindfulness_data") ?? [];

      // Updating the list
      allMindfulExercises.add(mindfulnessExercise);

      // Updated list putting
      await mindfulnessBox.put("mindfulness_data", allMindfulExercises);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mindfulness exercise added !"),
          duration: Duration(seconds: 3),
          backgroundColor: AppColors.primaryBlack,
        ),
      );
    } catch (e) {
      print("Service error : $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error adding Mindfulness exercise !"),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  // Method to get all the mindfulness exercises
  List<MindfulnessExerciseModel> getStoredMindfulnessExercises() {
    try {
      final allMindfulExercises = mindfulnessBox.get("mindfulness_data");

      if (allMindfulExercises != null && allMindfulExercises is List<dynamic>) {
        return allMindfulExercises.cast<MindfulnessExerciseModel>().toList();
      } else {
        return [];
      }
    } catch (err) {
      print("Get service error : $err");
      return [];
    }
  }

  // Method to delete mindfulness exercise
  Future<void> deleteMindfulnessExercise(
      MindfulnessExerciseModel mindfulnessExercise,
      BuildContext context) async {
    try {
      final allMindfulnessExercise = mindfulnessBox.get("mindfulness_data");
      allMindfulnessExercise.remove(mindfulnessExercise);

      await mindfulnessBox.put("mindfulness_data", allMindfulnessExercise);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mindfulness exercise deleted"),
          duration: Duration(seconds: 3),
          backgroundColor: AppColors.primaryBlack,
        ),
      );
    } catch (err) {
      print("delete service error : $err");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error deleting mindfulness exercise"),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
