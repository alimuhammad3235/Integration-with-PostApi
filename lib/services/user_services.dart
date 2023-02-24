import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:postapi/model/user_model.dart';

getuser() async {
  String url = "https://maaz-api.tga-edu.com/api/users";
  Uri uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = jsonDecode(response.body);
  final usermodel = UserModel.fromJson(body);
  return usermodel;
}

adduser(data) async {
  String url = "https://maaz-api.tga-edu.com/api/users";
  Uri uri = Uri.parse(url);
  final response = await http.post(uri,
      body: jsonEncode(data), headers: {"Content-Type": "application/json"});
  print(response);
}

deleteuser(int id) async {
  String url = "https://maaz-api.tga-edu.com/api/users/$id";
  Uri uri = Uri.parse(url);
  final response = await http.delete(uri);
  print(response);
}

updateuser(data,int id) async {
  String url = "https://maaz-api.tga-edu.com/api/users/$id";
  Uri uri = Uri.parse(url);
  final response = await http.put(uri,
      body: jsonEncode(data), headers: {"Content-Type": "application/json"});
  print(response.body);
}
