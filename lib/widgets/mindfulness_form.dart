import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditator_mobile_app/utils/colors.dart';
import 'package:meditator_mobile_app/widgets/reusable/custom_text_input_field.dart';

class MindfulnessForm extends StatefulWidget {
  const MindfulnessForm({super.key});

  @override
  State<MindfulnessForm> createState() => _MindfulnessFormState();
}

class _MindfulnessFormState extends State<MindfulnessForm> {
  final _formKey = GlobalKey();

  String _category = "";
  String _name = "";
  String _description = "";
  List<String> _instructions = [];
  int _duration = 0;
  String _instructionsUrl = "";
  File? _imagePath;

  final ImagePicker _imagePicker = ImagePicker();

  // Method to pick a image from gallery
  Future<void> _pickImage(ImageSource imageSource) async {
    final pickedFile = await _imagePicker.pickImage(source: imageSource);

    setState(() {
      if (pickedFile != null) {
        _imagePath = File(pickedFile.path);
      } else {
        print("No any image");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create a new mindfulness exercise",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryGreen),
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            child: Column(
              children: [
                // Displaying picked image
                if (_imagePath != null)
                  Image.file(
                    _imagePath!,
                    height: 200,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: const Text("Pick from camera"),
                    ),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      child: const Text("Pick from Gallery"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                //  Category input field
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

                // Instruction input field
                CustomTextInputField(
                  label: "Instructions",
                  keyBoardType: TextInputType.text,
                  hintText: "Instructions",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Instructions";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _instructions = newValue!.split(",");
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
                  label: "Instruction Url",
                  keyBoardType: TextInputType.text,
                  hintText: "Instruction Url",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Instructions Url";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _instructionsUrl = newValue!;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
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
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
