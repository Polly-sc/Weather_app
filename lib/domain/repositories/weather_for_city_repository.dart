
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/global_types.dart';
import '../entities/weather_for_city_entity.dart';

abstract class WeatherForCityRepository {
  Future<Either<Failure, List<WeatherForCityEntity>>> getAllCities(List<Coords> coords);
  // Future<WeatherForCityEntity> searchCity(Coords);
}