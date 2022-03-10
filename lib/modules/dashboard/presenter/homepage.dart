/* import 'dart:convert';
import 'package:app_flutter/common/app_controller.dart';
import 'package:app_flutter/common/OrgsMenuCard.dart';
import 'package:app_flutter/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../core/apiexterna_http.dart';

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
            () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
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
} */

import 'package:app_flutter/common/orgsdrawer.dart';
import 'package:app_flutter/core/apiexterna_http.dart';
import 'package:app_flutter/modules/login/presenter/cubit/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*class HomePage extends StatefulWidget {
  // para quando precisar de mudança de estado - StatefulWidget
  @override
  State<HomePage> createState() {
    return HomePage2();
  }
} */

class HomePage2 extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //filho
        actions: [
          //CustomSwitch(), // componentização é reaproveitamento de código
        ],
        title: Column(
          children: [
            TextButton(
                // Vai fazer o estado mudar
                onPressed: () {
                  final loggincubit = context.read<
                      LoginCubit>(); //atribui a mudança de estado a variavel logginCubit
                  loggincubit
                      .getNextGree(); //aqui acessei a nova variavel e accessei o getNext que tem a logica de alterar os estados
                },
                child: Text('Mudança de Estado')),
            TextMessage(),
          ],
        ),
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      drawer: OrgsDrawer(),
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
    );
  }
}

class TextMessage extends StatelessWidget {
  TextMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      // Aqui estou chamando o Bloc Builder para que o cubit faça o gerenciamento do estado a cada mudança
      builder: (context, state) {
        String message = ''; // criei variavel para guardar os tipos de mensagem

        if (state is LoginInitial) {
          message = 'Inicio 1';
        } else if (state is LoginSecondTime) {
          message = 'Inicio 2';
        } else if (state is LoginThirdTime) {
          message = 'Inicio 3';
        } else {
          message = 'Sem Inicio';
        }

        return Text(
          message,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        );
      },
    );
  }
}
