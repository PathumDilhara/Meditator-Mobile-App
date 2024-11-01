import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/sleep_exercise_model.dart';
import 'package:provider/provider.dart';

import '../../provider/custom_provider.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class SleepExerciseTab extends StatelessWidget {
  const SleepExerciseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Consumer<CustomProvider>(
              builder: (context, sleepExerciseData, child) {
                final List<SleepExerciseModel> sleepExercises =
                sleepExerciseData.getSleepExercises();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sleepExercises.length,
                  itemBuilder: (context, index) {
                    SleepExerciseModel singleSleepExercise =
                    sleepExercises[index];
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
                              singleSleepExercise.name,
                              style: AppTextStyles.subtitleStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                sleepExerciseData
                                    .deleteSleepExercise(
                                    singleSleepExercise, context);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.primaryPurple,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          singleSleepExercise.description,
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
