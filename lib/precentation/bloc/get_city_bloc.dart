import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/usecases/get_all_cities.dart';
import 'package:weather_app/precentation/bloc/get_city_event.dart';
import 'package:weather_app/precentation/bloc/get_city_state.dart';

import '../../core/error/failure.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

// BLoC 8.0.0
class GetAllCitiesBloc extends Bloc<GetAllCitiesEvent, GetAllCitiesState> {
  final GetAllCities getAllCities;

  GetAllCitiesBloc({required this.getAllCities}) : super(GetAllCitiesEmpty()) {
    on<GetCities>(_onEvent);
  }

  FutureOr<void> _onEvent(
      GetCities event, Emitter<GetAllCitiesState> emit) async {

    emit(GetAllCitiesLoading());
      final failureOfCities = await getAllCities(CityParams(cityCoords: event.cityCoords));

    emit(failureOfCities.fold(
            (failure) => GetAllCitiesError(message: _mapFailureToMessage(failure)),
            (cities) => GetAllCitiesLoaded(cities: cities)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}