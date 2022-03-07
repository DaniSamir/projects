/*import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http; // package para consumo de api

Future main() async {
  final todo = await fetch();
  print(todo.title);
}

Future<Todo> fetch() async {
  //criando future
  dynamic url =
      "https://jsonplaceholder.typicode.com/todos/1"; //melhor seria criar uma variavel para url do que colocá-lo diretamente
  // porém com nullsafety ele não deixa e tive que colocá-lo diretamente.
  var response = await http.get(url);
  dynamic json = jsonDecode(response.body);
  dynamic todo = Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
      userId: json['userId']);

  return todo;
}

/*{
	"userId": 1,
	"id": 1,
	"title": "delectus aut autem",
	"completed": false
}*/

class Todo {
  String? title;
  int? id;
  int? userId;
  bool? completed;

  Todo(
      {this.title,
      this.id,
      this.userId,
      this.completed}); // para transformar em argumentos nomeado, basta inserir {}
}*/

import 'package:app_flutter/modules/dashboard/presenter/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:app_flutter/common/app_controller.dart';
import 'package:http/http.dart' as http;

Future<List> pegarUsuarios() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Erro ao carregar dados do Servidor');
  }
}
