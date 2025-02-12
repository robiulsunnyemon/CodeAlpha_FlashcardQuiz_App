import '../../domain/entities/blog_entity.dart';

class BlogModel extends BlogEntity {
  BlogModel({
    super.id,
    required super.userId,
    required super.category,
    required UserDetailsModel super.userDetails,
    required super.title,
    required super.content,
    super.image,
    super.createdAt,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      userId: json['user_id'],
      category: json['category'],
      userDetails: UserDetailsModel.fromJson(json['user_details']),
      title: json['title'],
      content: json['content'],
      image: json['image'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "category": category,
      "user_details_id": userDetails.userId, // শুধুমাত্র ID পাঠানো হচ্ছে
      "title": title,
      "content": content,
      "image": image,
    };
  }
}

class UserDetailsModel extends UserDetailsEntity {
  UserDetailsModel({
    required super.userId,
    required super.firstName,
    required super.lastName,
    super.country,
    super.phoneNumber,
    super.createdAt,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      userId: json['user_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      country: json['country'],
      phoneNumber: json['phoneNumber']?.toString(),
      createdAt: json['created_at'],
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
