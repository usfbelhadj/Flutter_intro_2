import 'package:breaking_bad/models.dart';
import 'package:test/test.dart';
import 'package:faker/faker.dart';
import 'dart:math';



void main() {
    Random rng = Random();

 for (int i=1;i<=5;i++) {
    test("Test 1: Testing Class Attributes    $i / 5", () async {

    String name = faker.person.firstName();
    String img = faker.internet.httpUrl();
    int id = rng.nextInt(50);
    // ignore: non_constant_identifier_names
    Character new_char = Character(name, img, id);
      expect([new_char.name,new_char.img,new_char.id],[name,img,id],reason: "Person attribute are Wrong");

    });
  }
   for (int i=1;i<=5;i++) {
    test("Test 1: Testing toJson method  $i / 5", () async {

    String name = faker.person.firstName();
    String img = faker.internet.httpUrl();
    int id = rng.nextInt(50);
    var mapp = {"name": name, "imgUrl" : img,"id": id};
    final pers = Character(name,img,id);
      expect(pers.toJson(),mapp,reason: "toJson method Should return $mapp");

    });
  }
     for (int i=1;i<=5;i++) {
    test("Test 1: Testing from json  $i / 5", () async {

    String name = faker.person.firstName();
    String img = faker.internet.httpUrl();
    int id = rng.nextInt(50);
    var mapp = {"name": name, "img" : img,"char_id": id};

    final pers = Character.fromJson(mapp);
      expect([pers.name,pers.img,pers.id],[name,img,id],reason: "toJson method Should return $mapp");

    });
  }


}




