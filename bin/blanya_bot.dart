import 'dart:io';
import 'timing/waiting_time.dart';
import 'questions/time_questions.dart';

//para iniciar no terminal do vscode: dart bin/blanya_bot.dart

void main() async {
  String blanya = 'BlanyaBot:\n';
  var a = true;
  String usuario = '';
  var myStream = BotClock().blanyaBotStream(1,16);
  var subscriber = myStream.listen((event) {
    print('                                        BlanyaBot is activated for $event seconds');
  },onDone: () {
    print('BlanyaBot is finishing its work, bye :) ');
    a = false;
  },);

  print('-- Iniciando a BlanyaBot, aguarde....');
  await BotClock().clock(3);
  print('BlanyaBot:\n Olá :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Xauxau') ||
        usuario.contains('xauxau') ||
        usuario.contains('bye') ||
        usuario.contains('Bye') ||
        usuario.contains('tchau') ||
        usuario.contains('Tchau') ||
        usuario.contains('ate') ||
        usuario.contains('Ate') ||
        usuario.contains('até') ||
        usuario.contains('Até') ||
        usuario.contains('Adios') ||
        usuario.contains('adios') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(blanya + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      await BotClock().clock(2);
      TimeQuestions(usuario).timeQuestion();
    }else {
      BotClock().clock(2);
      print(blanya +
          ' Não fui treinada para responder a essa pergunta \n Sorry :( ');
      print(blanya + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando BlanyaBot--');
}