class Character {
  late String name;
  late String img;
  late int id;
  Character(this.name, this.img, this.id);

  Character.fromJson(Map<dynamic, dynamic> json) {
    Character(
      name = json["name"],
      img = json["img"],
      id = json["char_id"],
    );
  }

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
      };

  @override
  String toString() {
    return "id: $id, name : $name,  img: $img";
  }
}
