import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_state.dart';
import 'sign_up_view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            context.go('/home');
          }

          if (state.status == AuthStatus.error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message ?? 'Error')));
          }
        },
        builder: (context, state) {
          return SignUpView(
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            isLoading: state.status == AuthStatus.loading,
            onSignUp: _onSignUp,
            onSignIn: _onSignIn,
            onGoogle: _googleSignIn,
          );
        },
      ),
    );
  }

  void _onSignUp() {
    context.read<AuthBloc>().add(
      SignUpRequested(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        name: nameController.text.trim(),
      ),
    );
  }

  void _googleSignIn() {
    context.read<AuthBloc>().add(GoogleSignInRequested());
  }

  void _onSignIn() {
    context.pop();
  }
}
