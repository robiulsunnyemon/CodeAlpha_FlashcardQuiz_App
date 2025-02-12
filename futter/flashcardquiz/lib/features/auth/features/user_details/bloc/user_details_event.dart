part of 'user_details_bloc.dart';

abstract class UserDetailsEvent extends Equatable {}

class CreateUserDetailsEvent extends UserDetailsEvent{
  final UserDetailsModel data;
  CreateUserDetailsEvent({required this.data});
  @override
  // TODO: implement props
  List<Object?> get props => [data];

}