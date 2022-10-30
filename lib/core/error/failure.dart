import 'package:equatable/equatable.dart';

class Failure{

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}