import 'package:flutter/material.dart';
import 'application_router.dart';

class WeatherBloc extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
        title: 'Weather App',
    );
  }
}
