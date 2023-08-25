class UserModelApi {
  int id;
  String username;
  String name;
  String state;
  String avatarUrl;

  UserModelApi({
    required this.id,
    required this.username,
    required this.name,
    required this.state,
    required this.avatarUrl,
  });

  factory UserModelApi.fromJson(Map<String, dynamic> json) => UserModelApi(
        id: json['id'] as int? ?? 0,
        username: json['username'] as String? ?? "",
        name: json['name'] as String? ?? "",
        state: json['state'] as String? ?? "",
        avatarUrl: json['avatar_url'] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'name': name,
        'state': state,
        'avatar_url': avatarUrl
      };
}
