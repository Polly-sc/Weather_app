import 'package:equatable/equatable.dart';

import '../../core/global_types.dart';
import 'forecast_weather_entity.dart';


class WeatherForCityEntity extends Equatable{
  late int cityId;
  late String name;
  late int temp;
  late String condition;
  late Coords coords;
  late ForecastWeatherEntity forecastWeather;

  WeatherForCityEntity({
    required this.cityId,
    required this.name,
    required this.temp,
    required this.condition,
    required this.coords,
    required this.forecastWeather,
  });

  @override
  List<Object?> get props => [
    cityId,
    name,
    temp,
    condition,
    coords,
    forecastWeather,
  ];
}