import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'login_state.dart';

//no login cubit ficará toda a lógica do gerenciamento de estado.

class LoginCubit extends Cubit<LoginState> {
  int howManyTimes = 1;

  LoginCubit(LoginState initialState) : super(initialState);

  Future<void> getNextGree() async {
    // fazer a lógica de procura de estados

    howManyTimes++; //quem chamar esse metodo vai incrementar a vez que o estado mudou

    //lógica
    if (howManyTimes == 2) {
      // se a quant de vezes for igual a dois, vamos emitir (emit) para quem estiver ouvindo
      emit(
          LoginSecondTime()); //vamos emitir o estado (emit) para quem estiver ouvindo
    } else if (howManyTimes == 3) {
      emit(LoginThirdTime());
    }
  }

  Future<void> resetNextGree() async {
    howManyTimes = 1;
    emit(LoginInitial());
  }
}
