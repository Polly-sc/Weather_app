import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/forecast_weather_entity.dart';
import 'forecast_weather_element.dart';

class ForecastWeatherListWidget extends StatelessWidget {
  List<TodayForecastsEntity> todayForecasts;

  ForecastWeatherListWidget({Key? key, required this.todayForecasts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemCount: todayForecasts.length,
        separatorBuilder: (BuildContext context, int index) {
          return VerticalDivider(width: 12, color: Colors.transparent);
        },
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: ForecastWeatherElement(todayForecasts: todayForecasts[index]),
            );
            },
      ),
    );
  }

}

//146 высота