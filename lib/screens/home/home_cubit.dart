import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_bloc/data/repository/crash/crash_repository.dart';
import 'package:weather_bloc/data/repository/location/location_repository.dart';
import 'package:weather_bloc/data/repository/weather/weather_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_bloc/data/models/weather.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      this._weatherRepository,
      this._locationRepository,
      this._crashRepository,
  {HomeState? initialState,}
      ): super(initialState ?? const HomeState.initial());

  final WeatherRepository _weatherRepository;
  final LocationRepository _locationRepository;
  final CrashRepository _crashRepository;

 Future<void> getWeatherData() async {
   emit(const HomeState.loading());
   try {
     final location = await _locationRepository.getCurrentLocation();
     Weather weather;
     if (location != null) {
       weather = await _weatherRepository.getWeatherForPosition(
           location.lat, location.lon);
     } else {
       weather = await _weatherRepository.getWeatherForCityName('London');
     }
     emit(HomeState.success(weather));
   }catch (error, stackTrace) {
     debugPrint('$error,$stackTrace');
     await _crashRepository.reportError((error), stackTrace);
     emit(HomeState.error(error.toString()));
 }
 }
}
@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial()= HomeStateInitial;
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.success(Weather weather) = HomeStateSuccess;
  const factory HomeState.error(String massage) = HomeStateError;


}