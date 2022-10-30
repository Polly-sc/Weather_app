import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/common/app_theme/app_colors.dart';
import 'package:weather_app/data/models/city_wether_model.dart';
import 'package:weather_app/domain/usecases/get_all_cities.dart';
import 'package:weather_app/precentation/bloc/cities_list_cubit/all_cities_cubit.dart';
import 'package:weather_app/precentation/bloc/cities_list_cubit/all_cities_state.dart';
import 'package:weather_app/precentation/widgets/currentWeather/main_current_temp_widget.dart';

import '../../core/global_types.dart';
import '../../domain/entities/weather_for_city_entity.dart';
import '../navigation/mainNavigation.dart';
import '../widgets/currentWeather/sliding_up_panel_widget.dart';

class CurrentWeatherPage extends StatelessWidget{
  final int currentIndex;
  const CurrentWeatherPage({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const image = AssetImage('assets/images/img_background.png');
    return BlocBuilder<CitiesListCubit, CitiesState>(
          builder: (context, state) {
            List<WeatherForCityEntity> cities = [];
            bool isLoading = false;
            print(state);
            if (state is CitiesLoading && state.isFirstFetch) {
              return Container();
            }
            if (state is CitiesLoading) {
                return _loadingIndicator();
            } else if (state is CitiesLoaded) {
              cities = state.citiesList;
              print(cities[0]);
            } else if (state is CitiesError) {
              return Text(
                state.message,
                style: TextStyle(color: Colors.white, fontSize: 25),
              );
            }
              return Scaffold(
                    extendBody: true,
                    extendBodyBehindAppBar: true,
                    bottomNavigationBar: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        gradient: AppColors.buttonAppBarColor,
                      ),
                      child: BottomNavigationBarWidget(cities: cities),
                    ),
                    body: Stack(
                      children: <Widget>[
                        const SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image(image: image),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                      children: <Widget>[
                                        Flexible(
                                          flex: 98,
                                          child: Container(),
                                        ),
                                        Flexible(
                                          // flex: 183,
                                          flex: 296,
                                          child: MainCurrentTempWidget(cities: cities[currentIndex])
                                        ),
                                        Flexible(
                                          flex: 450,
                                          // flex: 563,
                                          child: Container(),
                                        )
                                      ]
                                  ),
                                ),
                              ]
                          ),
                        ),
                        SlidingUpPanelWidget(forecastWeather:  cities[currentIndex].forecastWeather),
                      ],
                    )
                );
          }
  );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

Widget _showErrorText(String errorMessage) {
  return Container(
    color: Colors.black,
    child: Center(
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
}

class BottomNavigationBarWidget extends StatefulWidget{
  List<WeatherForCityEntity> cities;
  BottomNavigationBarWidget({Key? key, required this.cities}) : super(key: key);

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();

}

class _BottomNavigationBarState extends State<BottomNavigationBarWidget>{

  late int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
}

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
// shape: CircularNotchedRectangle(), //shape of notch
// notchMargin: 5, //notche margin between floating button and bottom appbar
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu, color: Colors.white),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.navigationAppBarButton7582F4,
      onTap: (value) {
        _onItemTapped;
        if (value == 1) {
          Navigator.of(context).pushNamed(
              MainNavigationRouteNames.allCities, arguments: widget.cities);
        };
      },
    );
  }
}
