
import 'dart:io';

import 'questions/time_questions.dart';

void main() async {
  String blanya = 'BlanyaBot:\n';
  var a = true;
  String usuario = '';

  print('-- Iniciando a BlanyaBot, aguarde....');

  print('BlanyaBot:\n Olá :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(blanya + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      TimeQuestions(usuario).timeQuestion();
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    } else {
      print(blanya +
          ' Não fui treinada para responder a essa pergunta \n Sorry :( ');
      print(blanya + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando BlanyaBot--');
}
