import 'package:hive/hive.dart';

part 'sleep_exercise_model.g.dart';

@HiveType(typeId: 2)

class SleepExerciseModel {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final int duration;
  @HiveField(4)
  final String audioUrl;

  SleepExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
  });

  // Serialization and deserialization methods

  // Method to convert the json data into a SleepExerciseModel
  factory SleepExerciseModel.fromJson(Map<String, dynamic> json) {
    return SleepExerciseModel(
      category: json["category"],
      name: json["name"],
      description: json["description"],
      duration: json["duration"],
      audioUrl: json["audio_url"],
    );
  }

  // Method to convert SleepExerciseModel to json data
  Map<String, dynamic> toJson() {
    return {
      "category": category,
      "name": name,
      "description": description,
      "duration": duration,
      "audio_url": audioUrl,
    };
  }
}
