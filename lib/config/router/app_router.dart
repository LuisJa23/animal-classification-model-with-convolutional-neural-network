import 'package:flutter_application_2/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';



final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
 
  ]
  
);