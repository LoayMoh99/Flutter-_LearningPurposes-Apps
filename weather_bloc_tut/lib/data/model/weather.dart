import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'weather.g.dart';

//Serializing the State
@JsonSerializable()
class Weather extends Equatable {
  final String cityName;
  final double temperatureCelsius;
  final double temperatureFahrenheit;

  Weather({
    @required this.cityName,
    @required this.temperatureCelsius,
    this.temperatureFahrenheit,
  });

  @override
  List<Object> get props => [
        cityName,
        temperatureCelsius,
        temperatureFahrenheit,
      ];

  //Serializing the State and implemeting toJson and fromJsom functions..
  factory Weather.fromJson(Map<String, dynamic> jsonMap) =>
      _$WeatherFromJson(jsonMap);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
