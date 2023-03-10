import 'package:weather_bloc/data/models/weather.dart';

abstract class WeatherRepository{
  Future<Weather> getWeatherForPosition(double lat, double lon);
  Future<Weather> getWeatherForCityName(String city);
}