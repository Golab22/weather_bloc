import 'package:location/location.dart';
import 'package:weather_bloc/data/repository/location/location_repository.dart';
import 'package:weather_bloc/data/models/coords.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LocationRepository)
class LocationRepositoryImpl extends LocationRepository {
  LocationRepositoryImpl(this._location);

  final Location _location;

  @override
  Future<Coords?> getCurrentLocation() async {
    final hasPermission = await _location.hasPermission();
    if (hasPermission == PermissionStatus.granted ||
    hasPermission ==PermissionStatus.grantedLimited) {
    return _getLocation();
    }else {
    final requestResult = await _location.requestPermission();
    if (requestResult == PermissionStatus.granted ||
    requestResult== PermissionStatus.grantedLimited) {
    return _getLocation();
    }else {return null;
    }
    }
  }

  Future<Coords> _getLocation() async {
    final locationData = await _location.getLocation();
    final coords = Coords(
        lon: locationData.longitude!, lat: locationData.latitude!);
    return coords;
  }
}