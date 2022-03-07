import 'dart:convert';
import 'package:app_flutter/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'core/apiexterna_http.dart';

class HomePage extends StatefulWidget {
  // para quando precisar de mudança de estado - StatefulWidget
  @override
  State<HomePage> createState() {
    return HomePage2();
  }
}

class HomePage2 extends State<HomePage> {
  int counter = 0;
  bool dartTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //filho
        actions: [
          CustomSwitch(), // componentização é reaproveitamento de código
        ],
        title: Text("Início"),
      ),
      body: FutureBuilder<List>(
        future: pegarUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar usuários'),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index]['name']),
                    subtitle: Text(snapshot.data![index]['username']),
                  );
                });
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      /* Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          //mainAxisAlignment: MainAxisAlignment.spaceAround, serve para espaços entre linhas e colunas
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.pink,
                  child: CustomSwitch(),
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.pink,
                  child: CustomSwitch(),
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.pink,
                  child: CustomSwitch(),
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.pink,
                  child: CustomSwitch(),
                ),
              ],
            ),
          ],
        ),
      ),

      Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.amber[600],
        width: 48.0,
        height: 48.0,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 28.0,
            height: 28.0,
            color: Colors.pink,
          ),
        ),
      ),
      Center(
            //filho
            child: Container(
                child: GestureDetector(
          child: Text("Daniella: $counter", style: TextStyle(fontSize: 60)),
          onTap: () {},))),*/
      floatingActionButton: FloatingActionButton.extended(
        //filho
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        label: const Text('Adicionando'),
        icon: const Icon(Icons.star_sharp),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance
            .dartTheme, // este é um bool (true or false) lembrando que o dartTheme já foi atribuido como false
        onChanged: (value) {
          // chave de modificação com o valor
          AppController.instance.changeTheme();
        });
  }
}


//ver o get