class ArticlesModel {
  int artId;
  String image;
  String title;
  String description;
  String likes;
  String views;
  DateTime addDate;
  String username;
  String avatar;
  String profession;
  int userId;

  ArticlesModel({
    required this.artId,
    required this.image,
    required this.title,
    required this.description,
    required this.likes,
    required this.views,
    required this.addDate,
    required this.username,
    required this.avatar,
    required this.profession,
    required this.userId,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        artId: json["art_id"] as int? ?? 0,
        image: json["image"] as String? ?? '',
        title: json["title"] as String? ?? '',
        description: json["description"] as String? ?? '',
        likes: json["likes"] as String? ?? '',
        views: json["views"] as String? ?? '',
        addDate: DateTime.parse(json["add_date"]),
        username: json["username"] as String? ?? '',
        avatar: json["avatar"] as String? ?? '',
        profession: json["profession"] as String? ?? '',
        userId: json["user_id"] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "art_id": artId,
        "image": image,
        "title": title,
        "description": description,
        "likes": likes,
        "views": views,
        "add_date": addDate.toIso8601String(),
        "username": username,
        "avatar": avatar,
        "profession": profession,
        "user_id": userId,
      };
}
