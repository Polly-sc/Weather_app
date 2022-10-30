import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  //Gradients
  static const LinearGradient allCitiesListPageBackgroundColor = LinearGradient(
      colors: [
        weatherWidgets2E335A,
        weatherWidgets1C1B33,
      ],
      stops: [
        0.0,
        0.5
      ],
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomRight,
      tileMode: TileMode.repeated
  );

  static const LinearGradient slidingUpPanelBackPolimorphizmColor = LinearGradient(
      colors: [
        slidingUpPanel2E335A,
        slidingUpPanel1C1B33,
      ],
      stops: [
        0.0,
        0.5
      ],
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomRight,
      tileMode: TileMode.repeated
  );

  //Переделать градиент на Angular
  static const LinearGradient slidingUpPanelBackColor = LinearGradient(
      colors: [
        slidingUpPanel000000,
        slidingUpPanel612FAB,
      ],
      stops: [
        0.0,
        0.7
      ],
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomRight,
      tileMode: TileMode.repeated,
  );

  static const LinearGradient forecastBorderColor = LinearGradient(
    colors: [
      forecastBorderC159EC,
      forecastBorderOpacC159EC,
    ],
    stops: [
      0.0,
      0.7
    ],
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
    tileMode: TileMode.clamp,
  );

  static const LinearGradient buttonAppBarColor = LinearGradient(
    colors: [
      navigationAppBar25244C,
      navigationAppBar3A3A6A,
    ],
    stops: [
      0.0,
      0.7
    ],
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
    tileMode: TileMode.repeated,
  );

  static const LinearGradient cityWidgetsColor = LinearGradient(
    colors: [
      cityWidgets5936B4,
      cityWidgets362A84,
    ],
    stops: [
      0.0,
      0.7
    ],
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
    tileMode: TileMode.repeated,
  );


  //Weather Color Styles
  static const Color weatherWidgets2E335A = Color.fromRGBO(46, 51, 90, 1);
  static const Color weatherWidgets1C1B33 = Color.fromRGBO(28, 27, 51, 1);

  static const Color cityWidgets5936B4 = Color.fromRGBO(89, 54, 180, 1);
  static const Color cityWidgets362A84 = Color.fromRGBO(54, 42, 132, 1);
  //forecast
  static const Color forecast48319D = Color.fromRGBO(72, 49, 157, 0.2);

  static const Color forecastBorderC159EC = Color.fromRGBO(193, 89, 236, 1);
  static const Color forecastBorderOpacC159EC = Color.fromRGBO(193, 89, 236, 0.5);

  //Sliding Up Panel
  static const Color slidingUpPanel612FAB = Color.fromRGBO(97, 47, 171, 0.5);
  static const Color slidingUpPanel000000 = Color.fromRGBO(0, 0, 0, 0);

  static const Color slidingUpPanel2E335A = Color.fromRGBO(46, 51, 90, 0.26);
  static const Color slidingUpPanel1C1B33 = Color.fromRGBO(28, 27, 51, 0.26);

  static const Color slidingUpPanelMainButton1C1B33 = Color.fromRGBO(28, 27, 51, 0.26);

  //Bottom App Bar
  static const Color navigationAppBarButton7582F4 = Color.fromRGBO(117, 130, 244, 0.5);

  static const Color navigationAppBar25244C = Color.fromRGBO(37, 36, 76, 1);
  static const Color navigationAppBar3A3A6A = Color.fromRGBO(58, 58, 106, 1);

  // static const Color forecastBorder3658B1 = Color.fromRGBO(54, 88, 177, 1);
  // Color.fromRGBO(89, 54, 180, 0.26),
  // Color.fromRGBO(54, 42, 132, 0.26),
}
