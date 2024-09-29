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
  String _selectedCategory = "All";

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
    notifyListeners();
  }

  // getter for filtered data
  List<dynamic> get filteredData => _filteredData;

  // Method to filter the data
  void filterDataMethod(String category){
    _selectedCategory = category;
    if(category == "All"){
      _filteredData = _allData;
    } else if(category == "Mindfulness"){
      // let assign only MindfulnessExerciseModel type data in _allData list
      _filteredData = _allData.whereType<MindfulnessExerciseModel>().toList();
    } else if(category == "Meditation"){
      _filteredData = _allData.whereType<MeditationExerciseModel>().toList();
    } else if(category == "Sleep Stories"){
      _filteredData = _allData.whereType<SleepExerciseModel>().toList();
    }

    notifyListeners();
    // through filter chips this function will call, then according to there passing
    // String ("All", Mindfulness, ...) we change the data contains of the _filteredData
    // list and then again notify listeners, here listener(Consumer) is the home page
    // main SingleChileScrollView.
  }

  // Method to return selected category
  String getSelectedCategory(){
    return _selectedCategory;
  }
}
