// ignore_for_file: prefer_const_constructors

import 'package:app_flutter/modules/login/presenter/login.dart';
import 'package:app_flutter/modules/dashboard/presenter/homepage.dart';
import 'package:app_flutter/modules/login/presenter/cubit/login_cubit.dart';
import 'package:dio/dio.dart';

import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  AppModule({required analytics, required observer});

  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),

        // cubit
        Bind((i) => LoginCubit(LoginInitial())),

        // configs
        //Bind((i) => Api()),
      ];

  @override
  List<ModularRoute> get routes => [
        // login
        ChildRoute('/login', child: (context, args) => LoginScreen()),

        // dashboard
        ChildRoute('/dashboard', child: (context, args) => HomePage2()),
      ];
}
