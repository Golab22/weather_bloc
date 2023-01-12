import 'package:flutter/material.dart';
import 'package:weather_bloc/application/weather_bloc.dart';
import 'package:weather_bloc/injection/injection.dart';

void main() {
  configureDependencies();
  runApp(WeatherBloc());
}