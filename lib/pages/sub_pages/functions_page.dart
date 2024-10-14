import 'package:flutter/material.dart';
import 'package:meditator_mobile_app/models/functions_page_data_model.dart';

class FunctionsPage extends StatelessWidget {
  final FunctionsPageDataModel functionsPageDataModel;
  const FunctionsPage({
    super.key,
    required this.functionsPageDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Functions Page"),
      ),
    );
  }
}
