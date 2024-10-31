import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditator_mobile_app/models/sleep_exercise_model.dart';

import '../utils/colors.dart';

class SleepExerciseServices {
  var sleepBox = Hive.box("sleep_data_box");

  // Method to add new sleep exercise
  Future<void> addSleepExercise(
      SleepExerciseModel sleepExercise, BuildContext context) async {
    try {
      final allSleepExercises = sleepBox.get("sleep_data") ?? [];

      // Good practise to use json converting
      allSleepExercises.add(sleepExercise);

      // putting updated list to box under key sleep_data
      await sleepBox.put("sleep_data", allSleepExercises);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sleep exercise added !"),
          duration: Duration(seconds: 3),
          backgroundColor: AppColors.primaryBlack,
        ),
      );
    } catch (e) {
      print("Service error : $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error adding new sleep exercise!"),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
