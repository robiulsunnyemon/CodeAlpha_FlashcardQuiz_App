

import '../../domain/entities/blog_entity.dart';

class BlogModel extends BlogEntity {


  BlogModel({
    super.id=0,
    required super.title,
    required super.content,
    super.image= '',
    required super.userId,
    required super.userDetailsId,
    required super.createdAt,
    required super.category,

});

  // Method to convert BlogModel into a Map for POST request
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'user_id': userId,
      'category': category,
      'user_details_id': userDetailsId,
    };
  }

  // Factory method to create a BlogModel from JSON response
  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      title: json['title'],
      content: json['content'],
      userId: json['user_id'],
      category: json['category'],
      userDetailsId: json['user_details_id'],
      createdAt: json['createdAt'],
    );
  }
}
