
 class Character {
  late String name;
  late String img;
  late int id;
  Character(this.name, this.img, this.id);
  Character.fromJson(Map<String, dynamic> json) {
    Character(
      name = json["name"],
      img = json["img"],
      id = json["char_id"],
    );
  }
}
