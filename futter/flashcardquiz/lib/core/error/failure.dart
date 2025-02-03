import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// Server Failure
class ServerFailure extends Failure {}

// Cache Failure
class CacheFailure extends Failure {}

// Network Failure
class NetworkFailure extends Failure {}

// Validation Failure
class ValidationFailure extends Failure {
  final String message;
  ValidationFailure(this.message);

  @override
  List<Object> get props => [message];
}
