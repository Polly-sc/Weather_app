import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/app_theme/app_colors.dart';
import 'package:weather_app/domain/entities/forecast_weather_entity.dart';

class ForecastWeatherElement extends StatelessWidget{

  final TodayForecastsEntity todayForecasts;
  const ForecastWeatherElement({Key? key, required this.todayForecasts}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      width: 60,
          child: Column(
              children: <Widget> [
                SizedBox(height: 15),
                Text(todayForecasts.hour + 'AM', style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 20),
                Text(todayForecasts.condition,  style: TextStyle(color: Colors.white, fontSize: 10)),
                SizedBox(height: 20),
                Text(todayForecasts.temp.toString() + '°',  style: TextStyle(color: Colors.white, fontSize: 20)),
            ]
      ),
      decoration: BoxDecoration(
        color: AppColors.forecast48319D,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 1,
          color: AppColors.forecastBorderOpacC159EC),
        ),
    );
  }
}