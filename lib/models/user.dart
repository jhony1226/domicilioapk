// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.idRole,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.registerDate,
    this.status,
  });

  int id;
  int idRole;
  String name;
  String phone;
  String email;
  String password;
  DateTime registerDate;
  String status;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    idRole: json["idRole"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    registerDate: json["registerDate"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idRole": idRole,
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
    "registerDate": registerDate,
    "status": status,
  };
}
