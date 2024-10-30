import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/meditation_exercise_model.dart';
import 'package:meditator_mobile_app/provider/custom_provider.dart';
import 'package:meditator_mobile_app/utils/colors.dart';
import 'package:meditator_mobile_app/widgets/reusable/custom_text_input_field.dart';
import 'package:provider/provider.dart';

class MeditationForm extends StatefulWidget {
  const MeditationForm({super.key});

  @override
  State<MeditationForm> createState() => _MeditationFormState();
}

class _MeditationFormState extends State<MeditationForm> {
  final _formKey = GlobalKey<FormState>();

  String _category = "";
  String _name = "";
  String _description = "";
  int _duration = 0;
  String _audioUrl = "";
  String _videoUrl = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create a new Meditation",
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
                  height: 10,
                ),

                // Video url input field
                CustomTextInputField(
                  label: "Video Url",
                  keyBoardType: TextInputType.text,
                  hintText: "Video Url",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a Video Url";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _videoUrl = newValue!;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          // Create a new meditation from the user
                          final meditation = MeditationExerciseModel(
                            category: _category,
                            name: _name,
                            description: _description,
                            duration: _duration,
                            audioUrl: _audioUrl,
                            videoUrl: _videoUrl,
                          );

                          _formKey.currentState!.reset();
                          _category = "";
                          _name = "";
                          _description = "";
                          _duration = 0;
                          _audioUrl = "";
                          _videoUrl = "";

                          // Add the meditation through the provider then provider update state and save to storage
                          Provider.of<CustomProvider>(context, listen: false)
                              .addMeditation(meditation, context);
                        }
                      },
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
