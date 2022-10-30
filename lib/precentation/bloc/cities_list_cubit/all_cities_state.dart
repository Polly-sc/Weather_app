import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/weather_for_city_entity.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();

  @override
  List<Object?> get props => [];
}

class CitiesEmpty extends CitiesState {
  @override
  List<Object?> get props => [];
}

class CitiesLoading extends CitiesState {
  final List<WeatherForCityEntity> oldCitiesList;
  final bool isFirstFetch;

  const CitiesLoading(this.oldCitiesList, {this.isFirstFetch = false});

  @override
  List<Object?> get props => [oldCitiesList];
}

class CitiesLoaded extends CitiesState {
  final List<WeatherForCityEntity> citiesList;

  const CitiesLoaded(this.citiesList);

  @override
  List<Object?> get props => [citiesList];
}

class CitiesError extends CitiesState {
  final String message;

  const CitiesError({required this.message});

  @override
  List<Object?> get props => [message];
}