import 'package:equatable/equatable.dart';
import 'package:weather_app/core/global_types.dart';

abstract class GetAllCitiesEvent extends Equatable {
  const GetAllCitiesEvent();

  @override
  List<Object?> get props => [];
}

class GetCities extends GetAllCitiesEvent {
  final List<Coords> cityCoords;

  const GetCities(this.cityCoords);
}