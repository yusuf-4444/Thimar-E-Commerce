abstract class Faliures {
  final String message;
  Faliures(this.message);
}

class ServerFaliures extends Faliures {
  ServerFaliures(super.message);
}
