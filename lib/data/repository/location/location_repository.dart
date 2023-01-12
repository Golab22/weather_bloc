import 'package:weather_bloc/data/models/coords.dart';

abstract class LocationRepository{
  Future<Coords?> getCurrentLocation();
}