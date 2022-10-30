
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/data/datasources/weather_remote_data_suorce.dart';
import 'package:weather_app/domain/repositories/weather_for_city_repository.dart';
import 'package:weather_app/precentation/bloc/cities_list_cubit/all_cities_cubit.dart';
import 'package:weather_app/precentation/bloc/get_city_bloc.dart';

import 'data/datasources/weather_local_data_source.dart';
import 'data/repositories/weather_for_city_repositore_impl.dart';
import 'domain/usecases/get_all_cities.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {

  // sl.registerFactory(() => GetAllCitiesBloc(getAllCities: sl()));
  sl.registerFactory(() => CitiesListCubit(getAllCities: sl()));

  //UseCases
  sl.registerLazySingleton(() => GetAllCities(cityRepository: sl()));

  // Repository
  sl.registerLazySingleton<WeatherForCityRepository>(() => WeatherForCityRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<WeatherRemoteDataSource>(
          () => WeatherRemoteDataSourceImpl(client: http.Client()));

  sl.registerLazySingleton<CityLocalDataSource>(
          () => CityLocalDataSourceImpl(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}