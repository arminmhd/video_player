import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_stream_app/app/router/route_names.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_state.dart';
import 'sign_in_view.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
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
            context.go(AppRoutes.home);
          }

          if (state.status == AuthStatus.error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message ?? 'Error')));
          }
        },
        builder: (context, state) {
          return SignInView(
            emailController: emailController,
            passwordController: passwordController,
            isLoading: state.status == AuthStatus.loading,
            onSignIn: _signIn,
            onSignUp: _pushSignUp,
            onForgotPassword: () {},
            onGoogleLogin: _googleSignIn,
            onAppleLogin: () {},
            onFacebookLogin: () {},
          );
        },
      ),
    );
  }

  void _signIn() {
    context.read<AuthBloc>().add(
      SignInRequested(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
  }

  void _googleSignIn() {
    context.read<AuthBloc>().add(GoogleSignInRequested());
  }

  void _pushSignUp() {
    context.push(AppRoutes.register);
  }
}
