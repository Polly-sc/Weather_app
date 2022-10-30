import 'package:weather_app/data/models/forecast_weather_model.dart';
import 'package:weather_app/domain/entities/forecast_weather_entity.dart';
import 'package:weather_app/domain/entities/weather_for_city_entity.dart';

import '../../core/global_types.dart';

class InformModel {
  String cityId;

  InformModel(this.cityId);

  factory InformModel.fromJson(dynamic json) {
    return InformModel(json['abbr'] as String);
  }
}

class CityWeatherModel extends WeatherForCityEntity{
  CityWeatherModel({
  required super.cityId,
  required super.name,
  required super.temp,
  required super.condition,
  required super.coords,
  required super.forecastWeather,
  });

  factory CityWeatherModel.fromJson(Map<String, dynamic> json){
    print(json['forecasts']);
    return CityWeatherModel(
      cityId: json['info']['geoid'] as int,
      name: json['info']['tzinfo']['name'] as String,
      temp: json['fact']['temp'] as int,
      condition: json['fact']['condition'] as String,
      coords: Coords(json['info']['lon'] as double, json['info']['lat'] as double),
      forecastWeather: ForecastWeatherModel.fromJson(json['forecasts'][0]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityId': cityId,
      'name': name,
      'temp': temp,
      'condition': condition,
    };
  }
}
