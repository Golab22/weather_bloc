import 'package:flutter/material.dart';
import 'package:weather_bloc/injection/injection.dart';
import 'package:weather_bloc/screens/home/home.dart';
import 'package:weather_bloc/data/repository/crash/crash_repository.dart';
import 'package:weather_bloc/data/repository/location/location_repository.dart';
import 'package:weather_bloc/data/repository/weather/weather_repository.dart';
import 'home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_screen_view.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({HomeCubit? homeCubit})
      : cubit = homeCubit ??
            HomeCubit(
              getIt.get<WeatherRepository>(),
              getIt.get<LocationRepository>(),
              getIt.get<CrashRepository>(),
            );
  final HomeCubit cubit;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.cubit.getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder(
      bloc: widget.cubit,
      builder: (ctx, HomeState state) => state.when(
            initial: () => Container(),
            loading: () => HomeViewLoadingWidget(),
            success: (weather) => HomeScreenView(weather: weather),
            error: (error) => HomeViewErrorWidget(error),
          ));
}

class HomeViewLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Loading weather data',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      );
}

class HomeViewErrorWidget extends StatelessWidget {
  const HomeViewErrorWidget(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'An error occurred\n$message',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
