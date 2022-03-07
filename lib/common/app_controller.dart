import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  //terá uma instancia para appwidget e outra para o homepage

  static AppController instance =
      AppController(); // isso cria uma instancia do proprio appcontroler para que ela seja estatica

  bool dartTheme = false;
  changeTheme() {
    //metodo pq tem (){}
    dartTheme =
        !dartTheme; // quando o changethme for chamado o dart theme será ao contrário do valor que foi atribuido, então será verdadeiro.
    notifyListeners(); // isso "notifica " quem estiver escutando sobre as modicações no appwidget
  }
}
