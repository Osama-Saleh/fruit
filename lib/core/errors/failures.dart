abstract class Failures {
  final String message;

  Failures({required this.message});
  @override
  String toString() {
    return message;
  }
}

class ServerFailure extends Failures {
  ServerFailure({required super.message});
}
