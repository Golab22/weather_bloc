import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:weather_bloc/data/models/weather.dart';

part 'api_service.g.dart';

@singleton
@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @GET('/weather?units=metric')
  Future<Weather> getWeatherForPosition({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('appid') required String apiKey,
  });

  @GET('/weather?unit=metric')
  Future<Weather> getWeatherForCityName({
    @Query('q') required String city,
    @Query('appid') required String apiKey,
  });
}