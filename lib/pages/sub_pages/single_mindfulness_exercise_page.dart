import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_mobile_app/utils/colors.dart';
import 'package:meditator_mobile_app/utils/text_styles.dart';

class SingleMindfulnessExercisePage extends StatelessWidget {
  final MindfulnessExerciseModel mindfulnessExerciseModel;
  const SingleMindfulnessExercisePage({
    super.key,
    required this.mindfulnessExerciseModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mindfulnessExerciseModel.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mindfulnessExerciseModel.category,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                mindfulnessExerciseModel.name,
                style: AppTextStyles.titleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Duration  : ${mindfulnessExerciseModel.duration} min",
                style: AppTextStyles.bodyStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                mindfulnessExerciseModel.description,
                style: AppTextStyles.bodyStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Instructions :",
                style: AppTextStyles.bodyStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              // like a for loop select instruction of in each passed obj of mindfulnessExerciseModel
              ...mindfulnessExerciseModel.instructions.map(
                (instruction) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.primaryGreen.withOpacity(0.5),
                      ),
                      color: AppColors.primaryGreen.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        instruction,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
