class BlogEntity {
  final int? id;
  final int userId;
  final int category;
  final UserDetailsEntity userDetails;
  final String title;
  final String content;
  final String? image;
  final String? createdAt;

  BlogEntity({
    this.id,
    required this.userId,
    required this.category,
    required this.userDetails,
    required this.title,
    required this.content,
    this.image,
    this.createdAt,
  });
}

class UserDetailsEntity {
  final int userId;
  final String firstName;
  final String lastName;
  final String? country;
  final String? phoneNumber;
  final String? createdAt;

  UserDetailsEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    this.country,
    this.phoneNumber,
    this.createdAt,
  });
}
