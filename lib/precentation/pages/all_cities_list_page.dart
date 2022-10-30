import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/app_theme/app_colors.dart';

import '../../domain/entities/weather_for_city_entity.dart';
import '../navigation/mainNavigation.dart';
import '../widgets/allCitiesListPage/cityElement.dart';

class AllCitiesListPage extends StatelessWidget {
  final List<WeatherForCityEntity> cities;

  const AllCitiesListPage({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
              decoration: BoxDecoration(gradient: AppColors.allCitiesListPageBackgroundColor),
            child: ListView.separated(
                      itemCount: cities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: CityElement(cities: cities[index],),
                          onTap: () {
                            Navigator.of(context).pushNamed(MainNavigationRouteNames.currentCityWeather, arguments: index);
                          }
                        );
                      },
                      separatorBuilder: (BuildContext context, int index){
                        return Divider();
                      } ),
            )
      );
  }
}