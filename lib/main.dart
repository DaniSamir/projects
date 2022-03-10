import 'package:app_flutter/config/app_widget.dart';
import 'package:app_flutter/modules/dashboard/presenter/homepage.dart';
import 'package:app_flutter/modules/login/presenter/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(AppWidget()); //classe criada e pronta pra uso//
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Project",
      home: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(LoginInitial()), child: HomePage2()),
    );
  }
}
