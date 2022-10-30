import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/locator_service.dart';
import 'package:weather_app/precentation/bloc/get_city_state.dart';
import 'package:weather_app/precentation/pages/current_weather_page.dart';

import '../../../core/global_types.dart';
import '../../../domain/repositories/weather_for_city_repository.dart';
import '../../../domain/usecases/get_all_cities.dart';
import '../../bloc/cities_list_cubit/all_cities_cubit.dart';
import '../../bloc/get_city_bloc.dart';
import '../../navigation/mainNavigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: HomePage(),
      );
  }
}

class HomePage extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherForCityRepository>(
          create: (context) => GetIt.I<WeatherForCityRepository>(),
        )
      ],
          child: MultiBlocProvider(
                providers: [
                  BlocProvider<CitiesListCubit>(
                      create: (context) =>  GetIt.I<CitiesListCubit>()..loadCities()),
                ],
                child: MaterialApp(
                  onGenerateRoute: mainNavigation.onGenerateRoute,
                  routes: mainNavigation.routes,
                  initialRoute: mainNavigation.initialRoute,
                )
          )
    );
  }
}