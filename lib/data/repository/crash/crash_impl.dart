import 'package:flutter/foundation.dart';
import 'package:weather_bloc/data/repository/crash/crash_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CrashRepository)
class CrashRepositoryImpl extends CrashRepository {
  @override
  Future<void> reportError (dynamic error, StackTrace stackTrace) async
  {
    debugPrint('Error: $error\nStackTrace: $stackTrace');
  }
}