import 'package:flutter/material.dart';

import 'app_controller.dart';
import '../modules/dashboard/presenter/homepage.dart';

class AppWidget extends StatelessWidget {
  // usa-se para coisas estáticas

  @override
  Widget build(BuildContext context) {
    /* return Container(
      //override é um tipo que deve retornar algo, por isso o return.
      child: Center(
        child: Text(
          title, // a variavel title foi passada aqui
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.pink, fontSize: 200.0),
        }


      ),
    ); */
    return AnimatedBuilder(
      //este animatedbuilder irá escutar as modificações do appwiget
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.pink,
            brightness: AppController.instance.dartTheme
                ? Brightness
                    .dark // isso é o ternario para quando o appcontroller.ins..
                : Brightness
                    .light, //for verdadeiro (?) ele será brigtheness.dark, se não(:) ele será brig..light,
          ),
          home: HomePage(),
        );
      },
    );
  }
}
