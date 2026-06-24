import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/core/usecases/no_params.dart';

import 'package:movie_stream_app/features/auth/domain/usecases/auth_params.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/check_auth_use_case.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/current_user_use_case.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/google_sign_in_use_case.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/logout_use_case.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/register_use_case.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signIn;
  final SignUpUseCase signUp;
  final SignOutUseCase signOut;
  final CheckAuthUseCase checkAuth;
  final CurrentUserUseCase currentUser;
  final GoogleSignInUseCase googleSignIn;

  AuthBloc({
    required this.signIn,
    required this.signUp,
    required this.signOut,
    required this.checkAuth,
    required this.currentUser,
    required this.googleSignIn,
  }) : super(AuthState.initial()) {
    on<AuthCheckRequested>(_onCheckAuth);
    on<SignInRequested>(_onSignIn);
    on<SignUpRequested>(_onSignUp);
    on<GoogleSignInRequested>(_onGoogleSignIn);
    on<SignOutRequested>(_onSignOut);
  }

  // =========================
  // 🔵 CHECK AUTH
  // =========================
  Future<void> _onCheckAuth(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));

    try {
      final user = await currentUser(const NoParams());

      if (user != null) {
        emit(AuthState.authenticated(user));
      } else {
        emit(AuthState.unauthenticated());
      }
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, message: e.toString()));
    }
  }

  // =========================
  // 🟢 SIGN IN
  // =========================
  Future<void> _onSignIn(SignInRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));

    try {
      final user = await signIn(
        SignInParams(email: event.email, password: event.password),
      );

      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, message: e.toString()));
    }
  }

  // =========================
  // 🟡 SIGN UP
  // =========================
  Future<void> _onSignUp(SignUpRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));

    try {
      final user = await signUp(
        SignUpParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );

      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, message: e.toString()));
    }
  }

  // =========================
  // 🔵 GOOGLE SIGN IN
  // =========================
  Future<void> _onGoogleSignIn(
    GoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));

    try {
      final user = await googleSignIn();

      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, message: e.toString()));
    }
  }

  // =========================
  // 🔴 SIGN OUT
  // =========================
  Future<void> _onSignOut(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));

    try {
      await signOut(const NoParams());

      emit(AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.unauthenticated());
    }
  }
}
