class User {
  int id;
  String name;
  String email;
  String avatar;
  String? genre;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.avatar,
      this.genre});

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"],
        genre = json["genre"],
        avatar = json["avatar"];
}
