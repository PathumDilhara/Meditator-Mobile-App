import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditator_mobile_app/models/meditation_exercise_model.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_mobile_app/provider/filter_provider.dart';
import 'package:meditator_mobile_app/utils/colors.dart';
import 'package:meditator_mobile_app/utils/text_styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<FilterProvider>(context, listen: false).getData(
              context), // this will listen to a Future<> method until it is return success or error
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryPurple,
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Eror Loading Data",
                  style: AppTextStyles.titleStyle
                      .copyWith(color: AppColors.primaryGrey),
                ),
              );
            }
            return Consumer<FilterProvider>(
              builder: (BuildContext context, FilterProvider filterData,
                  Widget? child) {
                final completedData = filterData.filteredData;
                completedData.shuffle(); // shuffle the data in the list

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/meditation.png",
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Meditator",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryPurple,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Select a category to start exploring!",
                          style: AppTextStyles.subtitleStyle.copyWith(
                            color: AppColors.primaryDarkBlue,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryPurple.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  FilterChip(
                                    label: Text(
                                      "All",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "All"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filterDataMethod("All");
                                    },
                                    // Say to widget that it is selected or not
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "All",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false, // default tick there
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Mindfulness",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Mindfulness"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData
                                          .filterDataMethod("Mindfulness");
                                    },
                                    // Say to widget that it is selected or not
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "Mindfulness",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false, // default tick there
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Meditation",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Meditation"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filterDataMethod("Meditation");
                                    },
                                      // Say to widget that it is selected or not
                                  selected:
                                      filterData.getSelectedCategory() ==
                                      "Meditation",
                            selectedColor: AppColors.primaryPurple,
                            showCheckmark: false, // default tick there
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: AppColors.primaryPurple
                                    .withOpacity(0.5),
                                width: 2,
                              ),
                            ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Sleep Stories",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Sleep Stories"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (value) {
                                      filterData
                                          .filterDataMethod("Sleep Stories");
                                    },
                                      // Say to widget that it is selected or not
                                  selected:
                                      filterData.getSelectedCategory() ==
                                      "Sleep Stories",
                            selectedColor: AppColors.primaryPurple,
                            showCheckmark: false, // default tick there
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: AppColors.primaryPurple
                                    .withOpacity(0.5),
                                width: 2,
                              ),
                            ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (completedData.isNotEmpty)
                          StaggeredGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: completedData.map((data) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // Containers colors change according to model(type of data)
                                    color: data is MindfulnessExerciseModel
                                        ? AppColors.primaryGreen
                                        : data is MeditationExerciseModel
                                            ? AppColors.primaryDarkBlue
                                                .withOpacity(.6)
                                            : AppColors.primaryPurple,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // here data means above map(data) it is
                                        // a type of all providers contains Name,
                                        // Category, duration, description
                                        // ( these four are common), no need to
                                        // create a filter model if need create
                                        Text(
                                          data.name,
                                          style:
                                              AppTextStyles.titleStyle.copyWith(
                                            color: AppColors.primaryWhite,
                                          ),
                                        ),
                                        Text(
                                          data.category,
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryBlack
                                                .withOpacity(0.5),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${data.duration} min",
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryBlack
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                        Text(
                                          data.description,
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryWhite,
                                          ),
                                          maxLines:
                                              (data.description.length / 2)
                                                  .toInt(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
