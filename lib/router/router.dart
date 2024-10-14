import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditator_mobile_app/models/functions_page_data_model.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_mobile_app/pages/main_page.dart';
import 'package:meditator_mobile_app/pages/sub_pages/error_page.dart';
import 'package:meditator_mobile_app/pages/sub_pages/functions_page.dart';
import 'package:meditator_mobile_app/pages/sub_pages/mindfulness_exercise_details_page.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorPage(message: state.error.toString()));
    },
    routes: [
      GoRoute(
        name: "main page",
        path: "/",
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        name: "mindfulness_exercises",
        path: "/mindfulness_exercises",
        builder: (context, state) {
          // Normally we can't pass a dart obj through queryParameter that is why we
          // do json types, after we got it , convert into our dart obj called
          // MindfulnessExerciseModel, we got some data via queryParameters under the name
          // Extract queryParameter "mindfulnessExercises"
          final mindfulnessExerciseJson = state.uri.queryParameters[
              "mindfulness_exercises"]; // use same name passed as query parameter

          // Handle null case and potential JSON parsing errors
          if (mindfulnessExerciseJson == null) {
            return const ErrorPage(
                message: "No mindfulness exercise data provided");
          }
          try {
            final mindfulnessExercise = MindfulnessExerciseModel.fromJson(
                jsonDecode(mindfulnessExerciseJson));
            return MindfulnessExerciseDetailsPage(
              mindfulnessExerciseModel: mindfulnessExercise,
            );
          } catch (err) {
            // Handle JSON decoding errors gracefully
            return const ErrorPage(
                message: "Invalid mindfulness exercise data");
          }
          // return MindfulnessExerciseDetailsPage(
          //     mindfulnessExerciseModel: mindfulnessExercise);
        },
      ),
      GoRoute(
        path: "/functions",
        name: "functions page",
        builder: (context, state) {
          final FunctionsPageDataModel functionsPageDataModel =
              state.extra as FunctionsPageDataModel;
          return FunctionsPage(functionsPageDataModel: functionsPageDataModel);
        },
      )
    ],
  );
}
