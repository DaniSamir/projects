part of 'login_bloc.dart';

// aqui irá a lógica do cubit
@immutable
abstract class LoginState {
} // classe abstrata pois somente poderá ser herdada e não instanciada, ou seja,
// não pode haver um objeto criado a partir de sua instância
// são classes mais conceituais, ou seja, apenas definem algumas funcionalidades que as classes herdadas terão

//exemplo de uma classe herdade da classe abstrata
class LoginInitial extends LoginState {}

class LoginSecondTime extends LoginState {}

class LoginThirdTime extends LoginState {}

class LoginThereafter extends LoginState {}
