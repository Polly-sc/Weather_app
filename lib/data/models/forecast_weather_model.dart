import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:weather_app/domain/entities/forecast_weather_entity.dart';

class TodayForecastsModel extends TodayForecastsEntity {
  TodayForecastsModel({
    required super.hour,
    required super.temp,
    required super.condition,
  });

  factory TodayForecastsModel.fromJson(Map<String, dynamic> json) {
    return TodayForecastsModel(
      hour: json['hour'] as String,
      temp: json['temp'] as int,
      condition: json['condition'] as String,
    );
  }
}

class ForecastWeatherModel extends ForecastWeatherEntity {
  ForecastWeatherModel(
      {required super.todayForecastsList, required super.date});

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {

    var hoursObjJson = json['hours'] as List;
    List<TodayForecastsEntity> _hours = hoursObjJson
        .map((hoursJson) => TodayForecastsModel.fromJson(hoursJson))
        .toList();

    return ForecastWeatherModel(
      todayForecastsList: _hours,
      date: json['date'] as String,
    );
  }
}
