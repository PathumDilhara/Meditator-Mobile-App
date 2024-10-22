import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/utils/colors.dart';
import 'package:meditator_mobile_app/widgets/reusable/custom_text_input_field.dart';

class SleepExerciseForm extends StatefulWidget {
  const SleepExerciseForm({super.key});

  @override
  State<SleepExerciseForm> createState() => _SleepExerciseFormState();
}

class _SleepExerciseFormState extends State<SleepExerciseForm> {
  final _formKey = GlobalKey<FormState>();

  String _category = "";
  String _name = "";
  String _description = "";
  int _duration = 0;
  String _audioUrl = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create a new Sleep Exercise",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryGreen),
                ),
                const SizedBox(
                  height: 30,
                ),
      
                // Category input field
                CustomTextInputField(
                  label: "Category",
                  keyBoardType: TextInputType.text,
                  hintText: "Category",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a category";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _category = newValue!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
      
                // Name input field
                CustomTextInputField(
                  label: "Name",
                  keyBoardType: TextInputType.text,
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a name";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _name = newValue!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
      
                // Description input field
                CustomTextInputField(
                  label: "Description",
                  keyBoardType: TextInputType.text,
                  hintText: "Description",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a Description";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _description = newValue!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
      
                // Duration input field
                CustomTextInputField(
                  label: "Duration",
                  keyBoardType: TextInputType.number,
                  hintText: "Duration",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a duration";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _duration = int.parse(newValue!);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
      
                // Audio url input field
                CustomTextInputField(
                  label: "Audio Url",
                  keyBoardType: TextInputType.text,
                  hintText: "Audio Url",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a Audio Url";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _audioUrl = newValue!;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
      
                // Submit button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      // TODO : save data
                        onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor:
                        WidgetStatePropertyAll(AppColors.primaryGreen),
                      ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
