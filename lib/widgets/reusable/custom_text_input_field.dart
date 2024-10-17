import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/utils/colors.dart';

class CustomTextInputField extends StatelessWidget {
  final String label;
  final String? hintText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType keyBoardType;
  const CustomTextInputField({
    super.key,
    required this.label,
    this.hintText,
    this.validator,
    required this.keyBoardType,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryDarkBlue.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryDarkBlue.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyBoardType,
    );
  }
}
