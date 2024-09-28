import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditator_mobile_app/router/router.dart';

void main() {
  runApp(const MyApp());
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
