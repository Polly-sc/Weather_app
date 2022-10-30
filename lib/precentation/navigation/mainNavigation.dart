import 'package:flutter/material.dart';
import 'package:weather_app/precentation/pages/all_cities_list_page.dart';
import 'package:weather_app/precentation/pages/current_weather_page.dart';

import '../../domain/entities/weather_for_city_entity.dart';

abstract class MainNavigationRouteNames {
  static const currentCityWeather = '/';
  static const allCities = 'allCities';
}

class MainNavigation {
  final initialRoute = (MainNavigationRouteNames.currentCityWeather);
  final routes = <String, Widget Function(BuildContext)>{
    // MainNavigationRouteNames.currentCityWeather: (context) => CurrentWeatherPage(),
    // MainNavigationRouteNames.allCities: (context) => AllCitiesListPage(),
  };

  Route<Object>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.currentCityWeather:
        final configuration;
        if (settings.arguments == null) {
          configuration = 0;
        } else {
          configuration = settings.arguments as int;
        }
        return MaterialPageRoute(
            builder: (context) => CurrentWeatherPage(currentIndex: configuration)
        );
      case MainNavigationRouteNames.allCities:
        final configuration = settings.arguments as List<WeatherForCityEntity>;
        return MaterialPageRoute(
            builder: (context) => AllCitiesListPage(cities: configuration)
        );
      default:
        const widget = Text('Navigation Error!!!');
        return MaterialPageRoute(
          builder: (context) => widget,
        );
    }
  }
}