import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/weather_for_city_entity.dart';

abstract class GetAllCitiesState extends Equatable {
  const GetAllCitiesState();

  @override
  List<Object?> get props => [];
}

class GetAllCitiesEmpty extends GetAllCitiesState {}

class GetAllCitiesLoading extends GetAllCitiesState {}

class GetAllCitiesLoaded extends GetAllCitiesState {
  final List<WeatherForCityEntity> cities;

  const GetAllCitiesLoaded({required this.cities});

  @override
  List<Object?> get props => [cities];
}

class GetAllCitiesError extends GetAllCitiesState {
  final String message;

  const GetAllCitiesError({required this.message});

  @override
  List<Object?> get props => [message];
}