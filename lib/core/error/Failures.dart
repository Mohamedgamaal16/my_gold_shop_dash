class Failures {
  final String message;

  Failures(this.message);

  @override
  String toString() => message;
}

class NetworkFailure extends Failures {
  NetworkFailure(String message) : super(message);
}

class ServerFailure extends Failures {
  ServerFailure(String message) : super(message);
}

class ValidationFailure extends Failures {
  ValidationFailure(String message) : super(message);
}
