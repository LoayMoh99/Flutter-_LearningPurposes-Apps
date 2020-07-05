// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    cityName: json['cityName'] as String,
    temperatureCelsius: (json['temperatureCelsius'] as num)?.toDouble(),
    temperatureFahrenheit: (json['temperatureFahrenheit'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'temperatureCelsius': instance.temperatureCelsius,
      'temperatureFahrenheit': instance.temperatureFahrenheit,
    };
