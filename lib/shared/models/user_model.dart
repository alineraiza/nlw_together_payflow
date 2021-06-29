
import 'dart:convert';

class UserModel {
  final String name;
  final String? photoURL;

  UserModel({required this.name, required this.photoURL}); 
  
  factory UserModel.fromMap(Map<String,dynamic> map){
      return UserModel(name: map['name'], photoURL: map['photoURL']);
  }

  factory UserModel.fromjson(String json) => UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
    "name" : name,
    "photoURL" : photoURL,
  };
  String toJson() => jsonEncode(toMap());
}