class UserDetailsEntity {
  final int id;
  final int userId;
  final String firstName;
  final String lastName;
  final String? country;
  final int? phoneNumber;
  final DateTime? createdAt;

  const UserDetailsEntity({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    this.country,
    this.phoneNumber,
    required this.createdAt,
  });
}
