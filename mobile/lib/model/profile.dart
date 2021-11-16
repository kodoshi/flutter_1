
/// a Profile model responsible for holding API returns
class Profile {
  Profile({required this.name, required this.surname, required this.email, required this.image});

  final String name;
  final String surname;
  final String email;
  final String image;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    name: json["name"],
    surname: json["surname"],
    email: json["email"],
    image: json["image"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "email": email,
    "image": image
  };
}