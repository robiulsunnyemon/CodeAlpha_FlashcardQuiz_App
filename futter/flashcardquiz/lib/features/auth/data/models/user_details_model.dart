
import '../../domain/entities/user_details_entity.dart';

class UserDetailsModel extends UserDetailsEntity {
  const UserDetailsModel({
    required super.id,
    required super.userId,
    required super.firstName,
    required super.lastName,
    super.country,
    super.phoneNumber,
    required super.createdAt,
  });


  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      id: json['id'],
      userId: json['user_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      country: json['country'],
      phoneNumber: json['phoneNumber'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "firstName": firstName,
      "lastName": lastName,
      "country": country,
      "phoneNumber": phoneNumber,
    };
  }
}
