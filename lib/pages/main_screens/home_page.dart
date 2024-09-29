import 'package:flutter/material.dart';
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
            return Consumer<FilterProvider>(builder: (context, filterData, child) {
              final completedData = filterData.filteredData;

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
                                  label: const Text("All"),
                                  onSelected: (value) {},
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FilterChip(
                                  label: const Text("Mindfulness"),
                                  onSelected: (value) {},
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FilterChip(
                                  label: const Text("Meditation"),
                                  onSelected: (value) {},
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FilterChip(
                                  label: const Text("Sleep Stories"),
                                  onSelected: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },);
          },
        ),
      ),
    );
  }
}
