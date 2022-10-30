
import 'package:equatable/equatable.dart';

class TodayForecastsEntity extends Equatable{
  late String hour;
  late int temp;
  late String condition;

  TodayForecastsEntity({
    required this.hour,
    required this.temp,
    required this.condition,
  });

  @override
  List<Object?> get props => [
    hour,
    temp,
    condition,
  ];
}

class ForecastWeatherEntity extends Equatable{
  late List<TodayForecastsEntity> todayForecastsList;
  late String date;

  ForecastWeatherEntity({
    required this.todayForecastsList,
    required this.date,
  });

  @override
  List<Object?> get props => [
    todayForecastsList,
    date,
  ];
}