import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

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
        addDate: DateTime.parse(json["add_date"]?? DateTime.now().toIso8601String()),
        username: json["username"] as String? ?? '',
        avatar: json["avatar"] as String? ?? '',
        profession: json["profession"] as String? ?? '',
        userId: json["user_id"] as int? ?? 0,
      );

  ArticlesModel copyWith({
    int? artId,
    String? image,
    String? title,
    String? description,
    String? likes,
    String? views,
    DateTime? addDate,
    String? username,
    String? avatar,
    String? profession,
    int? userId,
  }) =>
      ArticlesModel(
        artId: artId ?? this.artId,
        title: title ?? this.title,
        description: description ?? this.description,
        likes: likes ?? this.likes,
        views: views ?? this.views,
        image: image ?? this.image,
        addDate: addDate ?? this.addDate,
        username: username ?? this.username,
        avatar: avatar ?? this.avatar,
        profession: profession ?? this.profession,
        userId: userId ?? this.userId,
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "description": description,
      };

  Future<FormData> getFormData() async {
    XFile file = XFile(image);
    String fileName = file.path.split('/').last;
    return FormData.fromMap({
      "title": title,
      "description": description,
      "image": await MultipartFile.fromFile(file.path, filename: fileName),
    });
  }

  @override
  String toString() {
    return '''
      "image": $image,
        "title": $title,
        "description": $description,
    ''';
  }
}
