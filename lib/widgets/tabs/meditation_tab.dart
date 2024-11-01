import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/provider/custom_provider.dart';
import 'package:meditator_mobile_app/utils/colors.dart';
import 'package:meditator_mobile_app/utils/text_styles.dart';
import 'package:provider/provider.dart';

import '../../models/meditation_exercise_model.dart';

class MeditationTab extends StatelessWidget {
  const MeditationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Consumer<CustomProvider>(
              builder: (context, meditationData, child) {
                final List<MeditationExerciseModel> meditations =
                    meditationData.getMeditations();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: meditations.length,
                  itemBuilder: (context, index) {
                    MeditationExerciseModel singleMeditation =
                        meditations[index];
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
                              singleMeditation.name,
                              style: AppTextStyles.subtitleStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                meditationData.deleteMeditation(
                                    singleMeditation, context);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.primaryPurple,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          singleMeditation.description,
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
