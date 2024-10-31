// Normally we do not use same class to handle all saving & hive

import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/meditation_exercise_model.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_mobile_app/models/sleep_exercise_model.dart';
import 'package:meditator_mobile_app/services/meditation_services.dart';
import 'package:meditator_mobile_app/services/mindfulness_exercise_services.dart';
import 'package:meditator_mobile_app/services/sleep_services.dart';

class CustomProvider extends ChangeNotifier {
  final List<MeditationExerciseModel> _meditations = [];
  final List<SleepExerciseModel> _sleepExercises = [];
  final List<MindfulnessExerciseModel> _mindfulnessExercises = [];

  // getter
  List<MeditationExerciseModel> get meditations => _meditations;
  List<SleepExerciseModel> get sleepExercises => _sleepExercises;
  List<MindfulnessExerciseModel> get mindfulnessExercises => _mindfulnessExercises;

  // Method to add a new meditation
  void addMeditation(MeditationExerciseModel meditation, BuildContext context) {
    try {
      _meditations.add(meditation);
      try {
        MeditationServices().addMeditation(meditation, context);
      } catch (err) {
        print("Provider local storage error $err");
      }
      notifyListeners();
    } catch (err) {
      print("Provider err $err");
    }
  }

  // Method to add a new meditation
  void addSleepExercise (SleepExerciseModel sleepExercise, BuildContext context) async {

    try{
      _sleepExercises.add(sleepExercise);
      try{
        SleepExerciseServices().addSleepExercise(sleepExercise, context);
      }catch(err){
        print("Error provider local storage : $err");
      }
      notifyListeners(); // let notify listeners
    } catch (err){
      print("Error from provider : $err");
    }
  }

// Method to add a new mindfulness exercise
  void addMindfulnessExercise (MindfulnessExerciseModel mindfulnessExercise, BuildContext context){
    try{
      _mindfulnessExercises.add(mindfulnessExercise);
      try {
        MindfulnessExerciseServices().addMindfulnessExercise(mindfulnessExercise, context);
      } catch(err){
        print("Provider local storage error");
      }
      notifyListeners();
    } catch (err){
      print("Provider error : $err");
    }
  }
}
