import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_stream_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:movie_stream_app/features/auth/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl(this.firebaseAuth, this.googleSignIn);

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserModel.fromFirebaseUser(credential.user!);
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user?.updateDisplayName(name);

    return UserModel.fromFirebaseUser(credential.user!);
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final account = await googleSignIn.signIn();

    if (account == null) {
      throw Exception('Google sign in cancelled');
    }

    final auth = await account.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );

    final result = await firebaseAuth.signInWithCredential(credential);

    return UserModel.fromFirebaseUser(result.user!);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }

  @override
  Future<String?> getIdToken() async {
    final user = firebaseAuth.currentUser;

    if (user == null) {
      throw Exception('User is not logged in');
    }

    return user.getIdToken();
  }

  @override
  Future<UserModel?> currentUser() async {
    final user = firebaseAuth.currentUser;

    if (user == null) return null;

    return UserModel.fromFirebaseUser(user);
  }
}
