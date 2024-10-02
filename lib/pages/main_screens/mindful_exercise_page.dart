import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_mobile_app/provider/mindful_exercise_provider.dart';
import 'package:meditator_mobile_app/utils/colors.dart';
import 'package:meditator_mobile_app/utils/text_styles.dart';
import 'package:provider/provider.dart';

class MindfulExercisePage extends StatelessWidget {
  const MindfulExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mindful Exercise",
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search box
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onChanged: (value) {
                    Provider.of<MindfulnessExerciseProvider>(context,
                            listen: false)
                        .searchMindfulnessExercise(value);
                  },
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<MindfulnessExerciseProvider>(
                  builder: (BuildContext context,
                      MindfulnessExerciseProvider mindfulnessExercisesList,
                      Widget? child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          mindfulnessExercisesList.mindfulnessExercise.length,
                      itemBuilder: (context, index) {
                        MindfulnessExerciseModel _mindfulExercise =
                            mindfulnessExercisesList.mindfulnessExercise[index];
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              "mindfulness_exercises",
                              queryParameters: {
                                // under the name "mindfulness_exercises" a query will
                                // be created & and pass through pushNamed, in obj _mindfulExercise have a method called
                                // toJson to convert MindfulnessExerciseModel into a json format
                                // let catch this in GoRouter
                                "mindfulness_exercises":
                                    jsonEncode(_mindfulExercise.toJson())
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryDarkBlue.withOpacity(0.1),
                            ),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  _mindfulExercise.imagePath,
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  height:
                                      MediaQuery.of(context).size.width * 0.12,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                _mindfulExercise.name,
                                style: AppTextStyles.subtitleStyle,
                              ),
                              subtitle: Text(
                                _mindfulExercise.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.bodyStyle.copyWith(
                                    color: AppColors.primaryDarkBlue
                                        .withOpacity(0.6),
                                    fontSize: 14),
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
        ),
      ),
    );
  }
}
