import 'package:movie_stream_app/core/services/secure_storage_service.dart';
import 'package:movie_stream_app/features/auth/data/datasources/auth_local_datasource.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageService storage;

  AuthLocalDataSourceImpl(this.storage);

  static const _tokenKey = 'token';

  @override
  Future<void> saveToken(String token) {
    return storage.write(_tokenKey, token);
  }

  @override
  Future<String?> getToken() {
    return storage.read(_tokenKey);
  }

  @override
  Future<void> deleteToken() {
    return storage.delete(_tokenKey);
  }

  @override
  Future<bool> hasToken() async {
    final token = await storage.read(_tokenKey);
    return token != null;
  }
}
