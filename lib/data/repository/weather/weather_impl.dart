import 'package:injectable/injectable.dart';
import './weather_repository.dart';
import 'package:weather_bloc/data/models/weather.dart';
import '../../api/api_service.dart';
import 'package:weather_bloc/config/enviroment_config.dart';


@Singleton(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  final ApiService _apiService;

  WeatherRepositoryImpl(this._apiService);

  @override
  Future<Weather> getWeatherForPosition(double lat, double lon) =>
      _apiService.getWeatherForPosition(
        lat: lat,
        lon: lon,
        apiKey: EnviromentConfig.apiKey,

      );

  @override
  Future<Weather> getWeatherForCityName(String city) =>
      _apiService.getWeatherForCityName(
          city: city, apiKey: EnviromentConfig.apiKey);
}