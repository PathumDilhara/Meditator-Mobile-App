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

// Method to get all the sleep exercises
  List<SleepExerciseModel> getStoredSleepExercises() {
    try {
      final allSleepExercises = sleepBox.get("sleep_data");
      if(allSleepExercises != null && allSleepExercises is List<dynamic>){
        return allSleepExercises.cast<SleepExerciseModel>().toList();
      } else {
        return [];
      }
    } catch(err){
      print("Get service error : $err");
      return [];
    }
  }

// Method to delete a sleep exercise
  Future<void> deleteSleepExercise(SleepExerciseModel sleepExercise, BuildContext context)async{
    try{
      final allSleepExercises = sleepBox.get("sleep_data");
      allSleepExercises.remove(sleepExercise);
      
      await sleepBox.put("sleep_data", allSleepExercises);

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sleep exercise deleted"),
            duration: Duration(seconds: 3),
            backgroundColor: AppColors.primaryBlack,
          ),
      );
    }catch(err){
      print("delete service error : $err");

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error delete sleep exercise"),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
          ),
      );
    }
  }
}
