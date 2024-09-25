class SleepExerciseModel {
  final String category;
  final String name;
  final String description;
  final int duration;
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
