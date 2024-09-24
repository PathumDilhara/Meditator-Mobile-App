class MindfulnessExerciseModel {
  final String category;
  final String name;
  final String description;
  final List<String> instructions;
  final int duration;
  final String instructionUrl;
  final String imagePath;

  MindfulnessExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.instructions,
    required this.duration,
    required this.instructionUrl,
    required this.imagePath,
  });

  // Serialization and deserialization methods

  // Method to convert the json data into a MindfulnessExerciseModel
  // MindfulnessExerciseModel.anyName, json contains normally String json map
  // We don't use camel casing for json data (pascal casing)
  factory MindfulnessExerciseModel.fromJson(Map<String, dynamic> json) {
    return MindfulnessExerciseModel(
        category: json['category'],
        name: json["name"],
        description: json["description"],
        instructions:List<String>.from(json["instructions"]) , // to convert this json["instructions"] to a list we use 'List<String>.from(data)'
        duration: json["duration"],
        instructionUrl: json["instruction_url"],
        imagePath: json["image_path"]);
  }

  // Method to convert MindfulnessExerciseModel to json data
  Map<String, dynamic> toJson(){
    return {
      "category": category,
      "name": name,
      "description": description,
      "instructions": instructions,
      "duration": duration,
      "instruction_url": instructionUrl,
      "image_path": imagePath,
    };
  }
}

// A factory method is a special type of method in object-oriented programming
// used to instantiate and return objects. Instead of directly calling a class
// constructor, the factory method typically contains logic to create objects.
// It is useful when object creation needs to include logic, such as data
// validation, or when you need to return different types of objects based on
// input parameters.

// In the provided code, the factory keyword in Dart is used to define a factory
// constructor. This allows creating an instance of MindfulnessExerciseModel from
// JSON data using the MindfulnessExerciseModel.fromJson() factory method.

// Here's how it works:

// MindfulnessExerciseModel.fromJson()

// * This factory constructor takes a JSON Map<String, dynamic> as input and creates
// a new instance of the MindfulnessExerciseModel class by extracting the necessary
// fields (e.g., category, name, description, etc.) from the JSON.

// * It's especially useful when you need to convert data from a format (like JSON)
// into a Dart object.

// The key reason to use a factory constructor like this is when you need to
// control how objects are created from external data (like API responses).
// A regular constructor wouldn't handle this conversion logic, whereas a
// factory constructor can.
