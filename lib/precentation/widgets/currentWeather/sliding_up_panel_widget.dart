import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/domain/entities/forecast_weather_entity.dart';
import 'package:weather_app/precentation/widgets/currentWeather/forecast_weather_list_widget.dart';

import '../../../common/app_theme/app_colors.dart';
import '../../bloc/cities_list_cubit/all_cities_cubit.dart';
import '../../bloc/cities_list_cubit/all_cities_state.dart';

class SlidingUpPanelWidget extends StatelessWidget {
  ForecastWeatherEntity forecastWeather;

  SlidingUpPanelWidget({Key? key, required this.forecastWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesListCubit, CitiesState>(
        builder: (context, state)
    {
      return SlidingUpPanel(
        minHeight: 300,
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
          )
        ],
        panel: Container(
          child: Stack(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 8.0,
                  sigmaY: 8.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.slidingUpPanelBackPolimorphizmColor,
                    border: Border.all(
                      width: 2,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0)),
                  ),
                  // color: Colors.transparent,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.slidingUpPanelBackColor,
                border: Border.all(
                  width: 2,
                  color: Colors.white.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0)),
              ),
              // color: Colors.transparent,
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 48,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 15,
                          width: 48,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.slidingUpPanelMainButton1C1B33),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0),
                                          side: BorderSide(
                                              color: Colors.transparent)))),
                              onPressed: () {},
                              child: Container(),
                            ),
                          ),
                        ),
                      ]),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.7),
                  height: 3,
                ),
                Container(height: 10),
                ForecastWeatherListWidget( todayForecasts: forecastWeather.todayForecastsList),
              ],
            )
          ]),
        ),
        color: Colors.transparent,
      );
    }
    );
  }
}
