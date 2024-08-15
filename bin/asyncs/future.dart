import 'dart:math';

void main(){

  Future myFuture =Future((){
    print('Going back to the future');
    return 21;
  }).then((valor)=> print('The value is $valor'));


Future<int> myFutureFunc()async{
  print('here is the future');
  await Future.delayed(Duration(seconds: 10));
  return 12;

}
//assim que faz esperar pra printar
//myFutureFunc().then((onValue)=> print('My new Function await/async value is $onValue'));

//exemplo de future
    Future exterminador = Future(() async{
    print('Venha comigo se quiser viver');
    await Future.delayed(Duration(seconds: 1));
    print('.');
    await Future.delayed(Duration(seconds: 1));
    print('.');
    await Future.delayed(Duration(seconds: 1));
    print('.');
    await Future.delayed(Duration(seconds: 1));
    print('.');
    await Future.delayed(Duration(seconds: 1));
    print('.');
    //throw Exception();
    return 'Hasta la vista, baby';
    })
    .then((value) => print(value))
    .onError((error, stackTrace) => print('An error occourred'))
    .whenComplete(() => print('the future is over')); 
    

    Future<int>myFutureErrorFunc (int a, int b) async{
      //try{}catch(e){}finally{}
      try{
        if(a>b){
        throw Exception();
        }
       print("Error named function here hihi");
       await Future.delayed(Duration(seconds:3));
       return 42;
      }catch(e){
        print('An error occorred: $e');
        return 42;
      }finally{
        print('THE FUTURE IS FINALLY OVER');
      }

    }

  myFutureErrorFunc(2, 1).then((onValue)=> print('the value here is $onValue'));
  print('MAIN DONE!!!!');
  
}