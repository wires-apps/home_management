sealed class Failure {
  const Failure();
}

class DefaultFailure extends Failure {
  const DefaultFailure();
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure();
}

class ServerFailure extends Failure {
  final String? message;

  const ServerFailure(
    this.message,
  );
}
