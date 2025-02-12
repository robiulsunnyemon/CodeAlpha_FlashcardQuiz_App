part of 'user_details_bloc.dart';

abstract class UserDetailsState extends Equatable{}

final class UserDetailsInitial extends UserDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDetailsCreated extends UserDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDetailsCreatedError extends UserDetailsState {
  final String message;
  UserDetailsCreatedError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
