import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/global_types.dart';
import 'package:weather_app/precentation/bloc/cities_list_cubit/all_cities_cubit.dart';
import 'package:weather_app/precentation/widgets/currentWeather/my_app.dart';

import 'core/platform/network_info.dart';
import 'data/datasources/weather_local_data_source.dart';
import 'data/datasources/weather_remote_data_suorce.dart';
import 'data/repositories/weather_for_city_repositore_impl.dart';
import 'domain/repositories/weather_for_city_repository.dart';
import 'package:http/http.dart' as http;

import 'domain/usecases/get_all_cities.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  GetIt.instance.registerSingleton(sharedPreferences);
  GetIt.instance.registerSingleton(http.Client);
  GetIt.instance.registerSingleton(InternetConnectionChecker());

  //Network
  GetIt.instance.registerSingleton<NetworkInfo>(NetworkInfoImpl(InternetConnectionChecker()));

  //Repositories
  final weatherForCityRepository = WeatherForCityRepositoryImpl(
      remoteDataSource: WeatherRemoteDataSourceImpl(client: http.Client()),
      localDataSource: CityLocalDataSourceImpl(sharedPreferences: sharedPreferences),
      networkInfo: NetworkInfoImpl(InternetConnectionChecker()));

  GetIt.instance.registerSingleton<WeatherForCityRepository>(weatherForCityRepository);
  GetIt.instance.registerSingleton<WeatherRemoteDataSource>(WeatherRemoteDataSourceImpl(client: http.Client()));
  GetIt.instance.registerSingleton<CityLocalDataSource>(CityLocalDataSourceImpl(sharedPreferences: sharedPreferences));
  //UseCases
  GetIt.instance.registerSingleton(GetAllCities(cityRepository: weatherForCityRepository));

  //Bloc
  GetIt.instance.registerSingleton(CitiesListCubit(getAllCities: GetAllCities(cityRepository: weatherForCityRepository)));

  // await di.init();
  const app = MyApp();
  runApp(app);
}