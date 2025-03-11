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
//
// class NoSuchElementFailure extends Failure {
//   const NoSuchElementFailure();
// }
//
// class WrongPinCodeFailure extends Failure {
//   const WrongPinCodeFailure();
// }
//
// class NotLoggedInFailure extends Failure {
//   const NotLoggedInFailure();
// }
//
// class WrongEmailOrPasswordFailure extends Failure {
//   const WrongEmailOrPasswordFailure();
// }
//
// class InfoFailure extends Failure {
//   final String message;
//
//   const InfoFailure(this.message);
// }
