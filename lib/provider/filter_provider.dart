import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/meditation_exercise_model.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_mobile_app/models/sleep_exercise_model.dart';
import 'package:meditator_mobile_app/provider/meditation_provider.dart';
import 'package:meditator_mobile_app/provider/mindful_exercise_provider.dart';
import 'package:meditator_mobile_app/provider/sleep_exercise_provider.dart';
import 'package:provider/provider.dart';

// This provider class has created for control other three main providers

class FilterProvider extends ChangeNotifier {
  List<dynamic> _allData = [];
  List<dynamic> _filteredData = [];

  // Method to get all data from other providers
  Future<void> getData(BuildContext context) async {
    // Ensure that this runs after build
    await Future.delayed(Duration.zero);

    // mindfulness exercises, since we need latest value of provider set listen to false
    // getting the list of mindfulness exercises models from MindfulExerciseProvider to here
    final List<MindfulnessExerciseModel> mindfulnessExercise =
        Provider.of<MindfulnessExerciseProvider>(context, listen: false)
            .mindfulnessExercise;

    // Meditations
    final List<MeditationExerciseModel> meditationExercises =
        Provider.of<MeditationExerciseProvider>(context, listen: false)
            .meditationExercises;

    // Sleep exercises
    final List<SleepExerciseModel> sleepExercises =
        Provider.of<SleepExerciseProvider>(context, listen: false)
            .sleepExercises;

    // Adding these all data to _allData list using spread ope..n
    _allData = [
      ...mindfulnessExercise,
      ...meditationExercises,
      ...sleepExercises
    ];

    // copying data

    // Here, _filteredData is assigned a reference to the same object as _allData.
    // This means that any changes made to _filteredData will also affect _allData,
    // and vice versa, since both variables point to the same underlying data.

    _filteredData = _allData;
  }

  // getter for filtered data
  List<dynamic> get filteredData => _filteredData;
}
