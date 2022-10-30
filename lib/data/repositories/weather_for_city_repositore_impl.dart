import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/global_types.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/domain/entities/weather_for_city_entity.dart';
import 'package:weather_app/domain/repositories/weather_for_city_repository.dart';

import '../../core/error/exception.dart';
import '../datasources/weather_local_data_source.dart';
import '../datasources/weather_remote_data_suorce.dart';

class WeatherForCityRepositoryImpl implements WeatherForCityRepository{
  final WeatherRemoteDataSource remoteDataSource;
  final CityLocalDataSource localDataSource;
  final NetworkInfoImpl networkInfo;

  WeatherForCityRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<WeatherForCityEntity>>> getAllCities(List<Coords> coords) async{
    if (await networkInfo.isConnected) {
      try {
        final remoteCity = await remoteDataSource.getAllCities(coords);
        localDataSource.cityToCache(remoteCity);
        return Right(remoteCity);
      } on ServerException{
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationCity = await localDataSource.getCityFromCahce();
        return Right(locationCity);
      } on CacheException{
        return Left(CacheFailure());
      }
    }
    throw UnimplementedError();
  }
}