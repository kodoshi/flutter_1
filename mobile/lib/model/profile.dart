import 'package:http/http.dart';

class Profile {
  Profile({required this.name, required this.surname, required this.email, required this.image, required this.contentType});

  final String name;
  final String surname;
  final String email;
  final ByteStream? image;
  final String contentType;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    name: json["name"],
    surname: json["surname"],
    email: json["email"],
    image: json["image"]["data"],
    contentType: json["image"]["contentType"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "email": email,
    "image": image
  };
}