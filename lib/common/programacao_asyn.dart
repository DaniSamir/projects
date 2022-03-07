/*void main() {
  print4();
  print("1");
  print("2");
  print("3");
}

Future<void> print4() async {
  await Future.delayed(
      Duration(seconds: 10)); // essa future pode ser um requisição web
  print("4");
}

void main() {
  var future = Future.delayed(Duration(seconds: 5));
  future.then((value) => print("10"));
  print("Primeiro");
  print("Segundo");
  print("Terceiro");
}

A programação assincrona no Dart é representado pelo objeto a Future (em java se chama Promisse). 
 Então quando se pede programação async leia-se uma future

 Ex: Future.dalayed(Duration(seconds: 2));
 o delayed é um construtor do future que executa depois de um tempo, então ele pede como parametro/condição a duration */