
import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/time_questions.dart';
import 'timing/waiting_time.dart';

void main() async{
  String blanyaBot = 'Blanya:\n';
  var a = true;
  String usuario = '';

  var myStream = BotClock().blanyaBotStream(1,10);
  var subscriber = myStream.listen((event) {
    print('                      Blanya está ativo a: $event segundos');
  },onDone: (){
    print('Blanya está sendo finalizado! Faça a ultima pergunta.');
    a = false;
  });

  print('-- Iniciando o Blanya, aguarde..--');
  await BotClock().clock(3);
  print('Blanya:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
     await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(blanyaBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      TimeQuestions(usuario).timeQuestion();
      await  BotClock().clock(1);
    } else if (GoodManners(usuario).isThisManners()) {
      GoodManners(usuario).goodManners();
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    }else {
      await  BotClock().clock(2);
      print(blanyaBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(blanyaBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando Blanya--');
}
