// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;

import '../data/api/api_service.dart' as _i9;
import '../data/repository/crash/crash_impl.dart' as _i4;
import '../data/repository/crash/crash_repository.dart' as _i3;
import '../data/repository/location/location.dart' as _i8;
import '../data/repository/location/location_repository.dart' as _i7;
import '../data/repository/modules.dart' as _i13;
import '../data/repository/weather/weather_impl.dart' as _i11;
import '../data/repository/weather/weather_repository.dart' as _i10;
import 'dio_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  final modules = _$Modules();
  gh.singleton<_i3.CrashRepository>(_i4.CrashRepositoryImpl());
  gh.singleton<_i5.Dio>(dioModule.dio());
  gh.lazySingleton<_i6.Location>(() => modules.location);
  gh.singleton<_i7.LocationRepository>(
      _i8.LocationRepositoryImpl(get<_i6.Location>()));
  gh.singleton<_i9.ApiService>(_i9.ApiService(get<_i5.Dio>()));
  gh.singleton<_i10.WeatherRepository>(
      _i11.WeatherRepositoryImpl(get<_i9.ApiService>()));
  return get;
}

class _$DioModule extends _i12.DioModule {}

class _$Modules extends _i13.Modules {}
