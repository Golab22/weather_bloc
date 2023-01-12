import 'package:go_router/go_router.dart';
import 'package:weather_bloc/screens/home/home_screen.dart';
import 'package:weather_bloc/screens/splash/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(path: '/',
      builder: (_, __) {
        return SplashScreen();
      },),
    GoRoute(path: '/home',
        builder: (_, __) {
          return HomeScreen();
        }
    ),
  ],
);
