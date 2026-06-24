abstract class AppFailure {
  final String message;
  const AppFailure(this.message);
}

class ServerFailure extends AppFailure {
  const ServerFailure([super.message = 'Server Error']);
}

class NetworkFailure extends AppFailure {
  const NetworkFailure([super.message = 'No Internet Connection']);
}

class AuthFailure extends AppFailure {
  const AuthFailure([super.message = 'Authentication Failed']);
}

class CacheFailure extends AppFailure {
  const CacheFailure([super.message = 'Cache Error']);
}

class UnknownFailure extends AppFailure {
  const UnknownFailure([super.message = 'Something Went Wrong']);
}
