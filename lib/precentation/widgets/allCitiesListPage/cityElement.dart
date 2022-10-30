import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/app_theme/app_colors.dart';

import '../../../core/global_types.dart';
import '../../../domain/entities/weather_for_city_entity.dart';

class CityElement extends StatelessWidget{
  final WeatherForCityEntity cities;
  const CityElement({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
            Container(
              width: 290,
              child: Column (
                children: [
                  Text(cities.temp.toString() + '°', style: TextStyle(fontSize: 94, fontWeight: FontWeight.w200, color: Colors.white)),
                  Text('H:' + cities.coords.lat.toInt().toString() + '°' + '  ' + 'L:' + cities.coords.lon.toInt().toString() + '°', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200, color: Colors.white)),
                  Text(CurrentCityList![cities.cityId]!, style: TextStyle(fontSize: 34, color: Colors.white)),
                ],
              ),
            ),
        Column (
          children: [
            Text(cities.condition, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.5))),
          ]
        )
        ],
      ),
      decoration: BoxDecoration(gradient: AppColors.cityWidgetsColor,
          borderRadius: BorderRadius.circular(
              35.0),
      )
    );
  }

}