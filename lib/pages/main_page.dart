import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditator_mobile_app/pages/main_screens/create_custom_exercise_page.dart';
import 'package:meditator_mobile_app/pages/main_screens/custom_exercises_page.dart';
import 'package:meditator_mobile_app/pages/main_screens/home_page.dart';
import 'package:meditator_mobile_app/pages/main_screens/mindful_exercise_page.dart';
import 'package:meditator_mobile_app/pages/main_screens/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Here we are going to create custom bottom navigation bar using in built bottom
  // navigation (not persistent_bottom_nav_bar) & svg icons, svg is more usefully
  // because they can change color, website for svg icons https://lucide.dev/

  // track the selected page
  int _selectedIndex = 0;

  // List of pages for bottom navigation bar, consider the order
  static const List<Widget> _pages = [
    HomePage(),
    MindfulExercisePage(),
    CreateCustomExercisePage(),
    CustomExercisesPage(),
    ProfilePage(),
  ];

  // Method to render when tapping icon with relevant page
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/house.svg"), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Mindful"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Create"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Custom"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Profile"),
          ],
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
