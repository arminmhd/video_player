import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_in/widgets/sign_in_divider.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_in/widgets/sign_in_footer.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_in/widgets/sign_in_form.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_in/widgets/sign_in_social_buttons.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_in/widgets/sign_in_title.dart';

class SignInView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final bool isLoading;
  final VoidCallback onSignIn;
  final VoidCallback onSignUp;
  final VoidCallback onForgotPassword;

  final VoidCallback onGoogleLogin;
  final VoidCallback onAppleLogin;
  final VoidCallback onFacebookLogin;

  const SignInView({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onSignIn,
    required this.onSignUp,
    required this.onForgotPassword,
    required this.onGoogleLogin,
    required this.onAppleLogin,
    required this.onFacebookLogin,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignInTitle(),

            SizedBox(height: 32.h),

            SignInForm(
              emailController: emailController,
              passwordController: passwordController,
              isLoading: isLoading,
              onSignIn: onSignIn,
              onForgotPassword: onForgotPassword,
            ),

            SizedBox(height: 24.h),

            const SignInDivider(),

            SizedBox(height: 24.h),

            SignInSocialButtons(
              onGoogle: onGoogleLogin,
              onApple: onAppleLogin,
              onFacebook: onFacebookLogin,
            ),

            SizedBox(height: 32.h),

            SignInFooter(
              text: 'Dont have an account?',
              actionText: 'Sign Up',
              onAction: onSignUp,
            ),
          ],
        ),
      ),
    );
  }
}
