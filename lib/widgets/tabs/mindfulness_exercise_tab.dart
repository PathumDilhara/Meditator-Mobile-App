import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';
import 'package:provider/provider.dart';

import '../../provider/custom_provider.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class MindfulnessExerciseTab extends StatelessWidget {
  const MindfulnessExerciseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Consumer<CustomProvider>(
              builder: (context, mindfulnessExerciseData, child) {
                final List<MindfulnessExerciseModel> mindfulnessExercises =
                    mindfulnessExerciseData.getMindfulnessExercises();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mindfulnessExercises.length,
                  itemBuilder: (context, index) {
                    MindfulnessExerciseModel singleMindfulnessExercise =
                        mindfulnessExercises[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: AppColors.primaryDarkBlue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              singleMindfulnessExercise.name,
                              style: AppTextStyles.subtitleStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                mindfulnessExerciseData
                                    .deleteMindfulnessExercise(
                                        singleMindfulnessExercise, context);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.primaryPurple,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          singleMindfulnessExercise.description,
                          style: AppTextStyles.bodyStyle.copyWith(
                            color: AppColors.primaryDarkBlue.withOpacity(0.8),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
