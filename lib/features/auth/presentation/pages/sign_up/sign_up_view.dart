import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_in/widgets/sign_in_divider.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_in/widgets/sign_in_social_buttons.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_up/widgets/sign_up_footer.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_up/widgets/sign_up_form.dart';
import 'package:movie_stream_app/features/auth/presentation/pages/sign_up/widgets/sign_up_title.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final bool isLoading;
  final VoidCallback onSignUp;
  final VoidCallback onSignIn;
  final VoidCallback? onGoogle;
  const SignUpView({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSignUp,
    required this.onSignIn,
    this.isLoading = false,
    this.onGoogle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignUpTitle(),

            SizedBox(height: 32.h),

            SignUpForm(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              isLoading: isLoading,
              onSignUp: onSignUp,
            ),
            SizedBox(height: 24.h),
            SignInDivider(),

            SizedBox(height: 24.h),
            SignInSocialButtons(onGoogle: onGoogle),
            SignUpFooter(
              text: 'Already have an account?',
              actionText: 'Sign In',
              onAction: onSignIn,
            ),
          ],
        ),
      ),
    );
  }
}
