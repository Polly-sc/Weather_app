import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/models/city_wether_model.dart';

abstract class CityLocalDataSource {
  Future<List<CityWeatherModel>> getCityFromCahce();
  Future<void> cityToCache(List<CityWeatherModel> cities);
}

const CACHED_CITY_LIST = 'CACHED_CITY_LIST';

class CityLocalDataSourceImpl implements CityLocalDataSource {
  final SharedPreferences sharedPreferences;

  CityLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CityWeatherModel>> getCityFromCahce(){
    final jsonCitiesList = sharedPreferences.getStringList(CACHED_CITY_LIST);

    if( jsonCitiesList!.isNotEmpty) {
      return Future.value(jsonCitiesList
          .map((city) => CityWeatherModel.fromJson(json.decode(city)))
          .toList());
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> cityToCache(List<CityWeatherModel> cityes) {
    final List<String> jsonCitiesList = cityes.map((city) => json.encode(city.toJson())).toList();

    sharedPreferences.setStringList(CACHED_CITY_LIST, jsonCitiesList);
    print('Cities to write Cache: ${jsonCitiesList.length}');
    return Future.value(jsonCitiesList);
  }
}