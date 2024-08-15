class BotClock {
  Future clock(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

  Stream blanyaBotStream(int interval, [int? macCount]) async* {
    int i = 1;
    while (i != macCount) {
      await Future.delayed(Duration(seconds: interval));
      yield i++; // ao invés de retornar "return", nós colhemos "yield".
    }
  }
}
