import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/domain/repositories/weather_for_city_repository.dart';

import '../../core/error/failure.dart';
import '../../core/global_types.dart';
import '../entities/weather_for_city_entity.dart';

class GetAllCities extends UseCase<List<WeatherForCityEntity>, CityParams>{
  final WeatherForCityRepository cityRepository;

  GetAllCities({required this.cityRepository});

  Future<Either<Failure, List<WeatherForCityEntity>>> call(CityParams coords) async{
    return await cityRepository.getAllCities(coords.cityCoords);
  }
}

class CityParams extends Equatable {
  final List<Coords> cityCoords;

  CityParams({required this.cityCoords});

  @override
  List<Object?> get props => [cityCoords];

}