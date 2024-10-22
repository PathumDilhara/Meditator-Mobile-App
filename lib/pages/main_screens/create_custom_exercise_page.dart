import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/widgets/meditaion_form.dart';
import 'package:meditator_mobile_app/widgets/mindfulness_form.dart';
import 'package:meditator_mobile_app/widgets/sleep_exercises_form.dart';

import '../../utils/colors.dart';

class CreateCustomExercisePage extends StatefulWidget {
  const CreateCustomExercisePage({super.key});

  @override
  State<CreateCustomExercisePage> createState() =>
      _CreateCustomExercisePageState();
}

class _CreateCustomExercisePageState extends State<CreateCustomExercisePage> {
  String typeOfContent = "Meditation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create custom exercise",
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
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: AppColors.primaryPurple),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: typeOfContent,
                          items: ["Meditation", "Sleep", "Mindfulness"].map(
                            (item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primaryDarkBlue,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          borderRadius: BorderRadius.circular(20),
                          onChanged: (value) {
                            setState(() {
                              typeOfContent = value!;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.primaryPurple,
                          ),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                if(typeOfContent == "Meditation")
                  const MeditationForm()
                else if(typeOfContent == "Sleep")
                  const SleepExerciseForm()
                else if(typeOfContent == "Mindfulness")
                  const MindfulnessForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
