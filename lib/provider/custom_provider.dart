// Normally we do not use same class to handle all saving & hive

import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/meditation_exercise_model.dart';
import 'package:meditator_mobile_app/services/meditation_services.dart';

class CustomProvider extends ChangeNotifier{
  final List<MeditationExerciseModel> _meditations = [];

  // getter
  List<MeditationExerciseModel> get meditations => _meditations;

  // Method to add a new meditation
  void addMeditation (MeditationExerciseModel meditation, BuildContext context){
    try{
      _meditations.add(meditation);
      try{
        MeditationServices().addMeditation(meditation, context);
      } catch (err){
        print("Provider local storage error $err");
      }
      notifyListeners();
    }catch(err){
      print("Provider err $err");
    }
  }
}