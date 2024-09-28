import 'package:go_router/go_router.dart';
import 'package:meditator_mobile_app/pages/main_page.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: "main page",
        path: "/",
        builder: (context, state) => const MainPage(),
      ),
    ],
  );
}
