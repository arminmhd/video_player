import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth auth;
  FirebaseService(this.auth);

  User? get currentUser => auth.currentUser;

  bool get isLoggedIn => auth.currentUser != null;

  Future signOut() async {
    await auth.signOut();
  }
}
