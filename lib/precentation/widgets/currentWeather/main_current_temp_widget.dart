
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/entities/weather_for_city_entity.dart';

import '../../../core/global_types.dart';

class MainCurrentTempWidget extends StatelessWidget {
  final WeatherForCityEntity cities;
  const MainCurrentTempWidget({Key? key, required this.cities}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print(cities.cityId);
    var _now = new DateTime.now();
    var _formatter = DateFormat('yyyy-MM-dd');
    var formattedTodayDate = _formatter.format(_now);
    return Column(
        children: <Widget>[
          Text(CurrentCityList![cities.cityId]!, style: TextStyle(fontSize: 34, color: Colors.white)),
          Text(cities.temp.toString() + '°', style: TextStyle(fontSize: 94, fontWeight: FontWeight.w200, color: Colors.white)),
          Text(cities.condition, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.5))),
          Text('H:' + cities.coords.lat.toInt().toString() + '°' + '  ' + 'L:' + cities.coords.lon.toInt().toString() + '°', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200, color: Colors.white)),
          Text(formattedTodayDate, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.5))),
        ],
      );
  }

}