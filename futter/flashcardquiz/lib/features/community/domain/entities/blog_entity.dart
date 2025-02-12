class BlogEntity {
  final int? id;
  final String title;
  final String content;
  final String image;
  final DateTime? createdAt;
  final int userId;
  final int category;
  final int userDetailsId;

  BlogEntity({
    this.id=0,
    required this.title,
    required this.content,
    required this.image,
    required this.createdAt,
    required this.userId,
    required this.category,
    required this.userDetailsId,
  });

}
