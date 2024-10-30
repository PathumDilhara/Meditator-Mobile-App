import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditator_mobile_app/models/meditation_exercise_model.dart';
import 'package:meditator_mobile_app/utils/colors.dart';

class MeditationServices {
  var meditationBox = Hive.box("meditation_data_box");

  // Method to add a new meditation to local storage
  // get all data from box under the key/reference meditation_data_box_key
  // update the list, then put updated list under/to reference meditation_data_box_key
  Future<void> addMeditation(
      MeditationExerciseModel meditation, BuildContext context) async {
    try {
      final dynamic allMeditations = meditationBox
          .get("meditation_data_box_key"); // if need can use another key

      // No need but let do
      // empty list to store data as List of Maps of String & dynamic
      List<Map<String, dynamic>> meditationList = [];

      // since meditationList is List of Maps let covert
      // allMeditations into List<Map<String, dynamic>> using
      // .map(...). Each item (meditation) in allMeditations is converted into
      // Map<String, dynamic> to enforce the correct type for meditationList.
      if (allMeditations != null && allMeditations is List) {
        meditationList = List<Map<String, dynamic>>.from(allMeditations
            .map((meditation) => Map<String, dynamic>.from(meditation)));
      }

      meditationList.add(meditation.toJson()); // toJson is in the MeditationExerciseModel

      await meditationBox.put("meditation_data_box_key", meditationList);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Meditation added !"),
          duration: Duration(seconds: 3),
          backgroundColor: AppColors.primaryBlack,
        ),
      );
    } catch (err) {
      print("Meditation services error $err");
      const SnackBar(
        content: Text("Failed to add a new meditation !"),
        duration: Duration(seconds: 3),
        backgroundColor: AppColors.primaryBlack,
      );
    }
  }
}
