import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meditator_mobile_app/models/meditation_exercise_model.dart';
import 'package:meditator_mobile_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_mobile_app/models/sleep_exercise_model.dart';

// Providers
import 'package:meditator_mobile_app/provider/filter_provider.dart';
import 'package:meditator_mobile_app/provider/meditation_provider.dart';
import 'package:meditator_mobile_app/provider/mindful_exercise_provider.dart';
import 'package:meditator_mobile_app/provider/sleep_exercise_provider.dart';

import 'package:meditator_mobile_app/router/router.dart';
import 'package:provider/provider.dart';

void main() async {
  // Hive registering
  await Hive.initFlutter();
  Hive.registerAdapter(MeditationExerciseModelAdapter());
  Hive.registerAdapter(MindfulnessExerciseModelAdapter());
  Hive.registerAdapter(SleepExerciseModelAdapter());

  runApp(
    // Since we have 4 providers we have to first initialised them by wrapping
    // MyApp() by multi provider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MindfulnessExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeditationExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SleepExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Meditator",
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routerConfig: AppRouter().router,
    );
  }
}

// dependencies
// ----------
// flutter pub add provider
// flutter pub add go_router
// flutter pub add hive
// flutter pub add hive_flutter
// flutter pub add flutter_staggered_grid_view
// flutter pub add youtube_player_flutter
// flutter pub add url_launcher
// flutter pub add image_picker
// flutter pub add google_fonts
// flutter pub add flutter_svg

// dev dependencies
// ----------------
// build_runner: ^2.4.12
// hive_generator: ^2.0.1

// for color palettes use https://colorhunt.co/
// for images use https://undraw.co/search
