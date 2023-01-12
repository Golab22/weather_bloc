import 'package:weather_bloc/data/models/weather.dart';
import 'package:dio/dio.dart';
import 'package:weather_bloc/config/enviroment_config.dart';

class ApiServiceDio {
  final Dio _dio = Dio();
  final _baseURL = EnviromentConfig.apiURL;

  Future<Weather> getWeatherFromCoords({
    required lat,
    required lon,
    required apiKey,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lat': lat,
      r'lon': lon,
      r'id': apiKey,
    };
    final _data = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Weather>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(_dio.options, '/weather?units=metric',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: _baseURL ?? _dio.options.baseUrl)));
    final value = Weather.fromJson(_result.data!);

    return value;
  }

  Future<Weather> getWeatherFromCity({
    required city,
    required apiKey,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'city': city,
      r'id': apiKey,
    };
    final _data = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Weather>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(_dio.options, '/weather?units=metric',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: _baseURL ?? _dio.options.baseUrl)));
    final value = Weather.fromJson(_result.data!);

    return value;
  }
}

RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
  if (T != dynamic &&
      !(requestOptions.responseType == ResponseType.bytes ||
          requestOptions.responseType == ResponseType.stream)) {
    if (T == String) {
      requestOptions.responseType = ResponseType.plain;
    } else {
      requestOptions.responseType = ResponseType.json;
    }
  }
  return requestOptions;
}
