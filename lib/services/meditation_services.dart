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
      final dynamic allMeditations =
          meditationBox.get("meditation_data"); // if need can use another key

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

      meditationList
          .add(meditation.toJson()); // toJson is in the MeditationExerciseModel

      await meditationBox.put("meditation_data", meditationList);

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
        backgroundColor: Colors.redAccent,
      );
    }
  }

  // Method to get all the meditations
  List<MeditationExerciseModel> getStoredMeditations() {
    try {
      final dynamic allMeditations = meditationBox.get("meditation_data");
      // If allMeditations is a List, the code iterates over each item in the
      // list, assuming each item represents a meditation in either Map<String,
      // dynamic> format or another format that can be cast to Map<String, dynamic>.
      if (allMeditations != null && allMeditations is List) {
        return allMeditations.map((meditation) {
          if (meditation is Map<String, dynamic>) {
            return MeditationExerciseModel.fromJson(meditation);
          } else {
            return MeditationExerciseModel.fromJson(
                Map<String, dynamic>.from(meditation));
          }
        }).toList();
      } else {
        // If no data exists, meditationBox.get("meditation_data") returns null.
        return [];
      }
    } catch (err) {
      // If an error occurs, it's caught, printed as "Services load
      // error : $err", and the method returns an empty list [].
      print("Services load error : $err");
      return [];
    }
  }

  // Method to delete a meditation
  Future<void> deleteMeditationFromStorage(
      MeditationExerciseModel meditationExercise, BuildContext context) async {
    try {
      final dynamic allMeditations = meditationBox.get("meditation_data"); // type of allMeditation is dynamic not Map<String, dynamic>

      if (allMeditations != null && allMeditations is List) {
        // New list type of Map<String, dynamic>
        // List.from is a Dart constructor that creates a new List from any given iterable.
        //By specifying List<Map<String, dynamic>>.from(...), we ensure that the
        // output list (meditationList) is explicitly of type List<Map<String, dynamic>>.
        List<Map<String, dynamic>> meditationList =
            List<Map<String, dynamic>>.from(
          allMeditations.map( // iterates over each item in allMeditations, applying a transformation function to each item.
            (meditation) => Map<String, dynamic>.from(meditation),
          ),
        );
        // This transformation is needed because allMeditations contains
        // dynamic data instead of Map<String, dynamic>

        meditationList.removeWhere((meditation) {
          MeditationExerciseModel currentMeditation =
              MeditationExerciseModel.fromJson(
                  (Map<String, dynamic>.from(meditation)));
          return currentMeditation.name == meditationExercise.name &&
              currentMeditation.category == meditationExercise.category;
        });
        await meditationBox.put("meditation_data", meditationList);

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Meditation deleted"),
              duration: Duration(seconds: 3),
              backgroundColor: AppColors.primaryBlack,
            ),
        );
      }
    } catch (err) {
      print("Service delete error : $err");

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error deleting meditation"),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
          ),
      );
    }
  }
}
