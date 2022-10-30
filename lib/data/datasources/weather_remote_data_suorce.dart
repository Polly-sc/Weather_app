import 'dart:convert';

import 'package:weather_app/core/global_types.dart';
import 'package:weather_app/data/models/city_wether_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<List<CityWeatherModel>> getAllCities(List<Coords> coords);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource{
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CityWeatherModel>> getAllCities(List<Coords> coords) async{
    List<CityWeatherModel> allWeatherList = [];
    late CityWeatherModel currentCity;
    late String lon;
    late String lat;
    print(coords);
    print(coords[0].lon.toString());
    print(coords[1].lon.toString());
    print(coords[2].lon.toString());
    print(coords.length);
    for(int i = 0; i < coords.length; i++) {
      lon = coords[i].lon.toString();
      lat = coords[i].lat.toString();
      print(lon);
      print(lat);
      final response = await client.get(
        Uri.parse(
            'https://api.weather.yandex.ru/v2/forecast?lat=$lat&lon=$lon&extra=true'),
      );

      if (response.statusCode == 200) {
        print(response.statusCode);
        final cityWeather = json.decode(response.body);
        print(CityWeatherModel.fromJson(cityWeather));
        currentCity = CityWeatherModel.fromJson(cityWeather);
        if (currentCity != null) {
          allWeatherList.add(currentCity);
        }
        print(allWeatherList);
      }
    }
      return allWeatherList ;
    throw UnimplementedError;
  }

}