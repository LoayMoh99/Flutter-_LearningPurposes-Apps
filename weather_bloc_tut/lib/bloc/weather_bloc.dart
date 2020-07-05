import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_bloc_tut/data/model/weather.dart';
import 'package:weather_bloc_tut/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository);
  @override
  WeatherState get initialState {
    // Super class (HydratedBloc) will try to get the lastly stored state.
    // If there isn't a stored state (null), return a default WeatherInitial.
    return super.initialState ??
        WeatherInitial(); // ?? is null callsing operator
  }

  @override
  WeatherState fromJson(Map<String, dynamic> jsonMap) {
    //  implement fromJson
    try {
      final weather = Weather.fromJson(jsonMap);
      return WeatherLoaded(weather);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(WeatherState state) {
    //  implement toJson
    if (state
        is WeatherLoaded) //as this is the only state that can be serialized..
      return state.weather.toJson();
    else
      return null;
  }

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield WeatherLoading();
    if (event is GetWeather) {
      try {
        final Weather weather =
            await weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError("Couldn't fetch weather,are you Online?");
      }
    } else if (event is GetDetailedWeather) {
      try {
        final Weather weather =
            await weatherRepository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError("Couldn't fetch weather,are you Online?");
      }
    }
  }
}
