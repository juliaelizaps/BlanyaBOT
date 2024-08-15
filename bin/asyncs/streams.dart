import 'dart:async';


void main()async{
  Stream myStream(int interval,[int? macCount])async*{
    int i = 1;
    while(i != macCount){
      print('Counting $i');
      await Future.delayed(Duration(seconds: interval));
      yield i++;  // ao invés de retornar "return", nós colhemos "yield".

    }
  }
  
  var blanyaStream = myStream(1, 30).asBroadcastStream();
  StreamSubscription mysubscriber = blanyaStream.listen((event) {
    if (event.isEven){
      print('this number is even');
    }
  }, onError:(e){
    print('Error: $e');
  }, onDone: (){
    print('Subscriber is gone');
  });

  //fazer mais que um subscriber escutar a Stream => .asBroadcastStream();
  var mySubscriber2= blanyaStream.map((event) =>'Subscriber 2 watching: $event').listen(print);

  //Pausando, resumindo e calcelando uma Stream
  await Future.delayed(Duration(seconds: 3));
  mysubscriber.pause();
  print("Stream paused");
  await Future.delayed(Duration(seconds: 10));
  mysubscriber.cancel();
  print("Stream canceled");

//Adicionando um timer, pq se não ele não para nunca.
  Timer(Duration(seconds: 10), () {
    mySubscriber2.cancel();
    print("Stream canceled");
  });
  mysubscriber.cancel();
  print("Stream canceled");
}