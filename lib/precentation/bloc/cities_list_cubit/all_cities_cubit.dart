import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/entities/weather_for_city_entity.dart';
import 'package:weather_app/precentation/bloc/cities_list_cubit/all_cities_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/global_types.dart';
import '../../../domain/usecases/get_all_cities.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class CitiesListCubit extends Cubit<CitiesState> {
  final GetAllCities getAllCities;

  CitiesListCubit({required this.getAllCities}) : super(CitiesEmpty());

  List<Coords> coordsList = AllCitiesListCoords;

  void loadCities() async {
    if (state is CitiesLoading) return;

    final currentState = state;

    var oldPerson = <WeatherForCityEntity>[];
    if (currentState is CitiesLoaded) {
      oldPerson = currentState.citiesList;
    }

    emit(CitiesLoading(oldPerson, isFirstFetch: coordsList == AllCitiesListCoords));

    final failureOrPerson = await getAllCities(CityParams(cityCoords: coordsList));

    failureOrPerson.fold(
            (error) => emit(CitiesError(message: _mapFailureToMessage(error))),
            (character) {
          final cities = (state as CitiesLoading).oldCitiesList;
          cities.addAll(character);
          emit(CitiesLoaded(cities));
        });
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