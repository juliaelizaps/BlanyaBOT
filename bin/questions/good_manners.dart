
class GoodManners{
  String question;
  bool isThisGoodManners = false;
  String blanyaBot = 'BlanyaBot:\n';
  GoodManners(this.question);

  bool isThisManners(){
    if(question.contains('oi') ||
        question.contains('ola')||
        question.contains('Oi') ||
        question.contains('Ola') ||
        question.contains('obrigado') ||
        question.contains('obrigada') ||
        question.contains('Obrigado') ||
        question.contains('Obrigada') ||
        question.contains('bom') ||
        question.contains('boa') ||
        question.contains('tarde') ||
        question.contains('noite') ||
        question.contains('de nada') ||
        question.contains('De nada')){
      isThisGoodManners = true;
    }
    return isThisGoodManners;
  }

  goodManners(){
    if(question.contains('Bom dia')|| question.contains('bom dia')){
      print(blanyaBot+' Bom dia Flor do dia!');
    } else if(question.contains('Boa tarde')|| question.contains('boa tarde')){
      print(blanyaBot+' Opa sô, boa tarde!');
    } else if(question.contains('Boa noite')|| question.contains('boa noite')){
      print(blanyaBot+ ' Uma bela noite, não é mesmo?');
    } else if(question.contains('oi')|| question.contains('Oi') || question.contains('Ola')|| question.contains('ola')){
      print(blanyaBot+' Muito prazer!');
    } else if( question.contains('obrigado')|| question.contains('Obrigado') || question.contains('Obrigada')|| question.contains('obrigada')){
      print(blanyaBot + ' De nada, fique a vontade c:');
    }
  }

}