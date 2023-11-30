import 'dart:convert';

import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  final UserService _service = UserService();
  List<User> _users = [];
  List<User> get users => _users;

  Future<void> getUsers() async {
    final response = await _service.fetchUsers();
    _users = response;
    notifyListeners();
  }
}

class UserService {
  final url = 'https://jsonplaceholder.typicode.com/users';
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonBody = jsonDecode(response.body);
      // print(jsonBody.toString());
      // final List<dynamic> usersJson = jsonBody[];
      // print(usersJson.toString());
      final List<User> users =
          jsonBody.map((dynamic json) => User.fromJson(json)).toList();
      // print(users.toList());
      return users;
    } else {
      throw Exception("Failed to fetch Users");
    }
  }

  postUser(User user) async {
    var response = await http.post(Uri.parse(url), body: {
      "id": user.id.toString(),
      "name": user.name,
      "email": user.email,
      "phone": user.phone,
      "catchPhrase": user.catchPhrase,
      "bs": user.bs,
      "latitude": user.latitude,
      "longitude": user.longitude,
    });
    print(response.body + "\n" + response.statusCode.toString());
  }
}
