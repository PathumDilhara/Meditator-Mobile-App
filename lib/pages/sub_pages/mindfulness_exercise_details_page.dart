import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_mobile_app/utils/colors.dart';
import 'package:meditator_mobile_app/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class MindfulnessExerciseDetailsPage extends StatelessWidget {
  final MindfulnessExerciseModel
      mindfulnessExerciseModel; // also can get from provider
  const MindfulnessExerciseDetailsPage({
    super.key,
    required this.mindfulnessExerciseModel,
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mindfulness Details",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mindfulnessExerciseModel.name,
                  style: AppTextStyles.titleStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  mindfulnessExerciseModel.category,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(mindfulnessExerciseModel.description),
                const SizedBox(
                  height: 10,
                ),
                const Text("Instruction"),
                const SizedBox(
                  height: 20,
                ),
                ...mindfulnessExerciseModel.instructions.map(
                  (instruction) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 8,
                          color: AppColors.primaryBlack,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text(instruction)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.timer,
                      size: 30,
                      color: AppColors.primaryGrey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${mindfulnessExerciseModel.duration} min"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _launchUrl(mindfulnessExerciseModel.instructionUrl);
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          AppColors.primaryGreen)),
                  child: const Text(
                    "View Detailed Instruction",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
