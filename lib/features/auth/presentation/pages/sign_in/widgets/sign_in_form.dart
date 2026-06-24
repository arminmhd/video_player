import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';
import 'package:movie_stream_app/core/utils/validators.dart';
import 'package:movie_stream_app/core/widgets/app_button.dart';
import 'package:movie_stream_app/core/widgets/app_text_field.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final bool isLoading;
  final VoidCallback? onForgotPassword;
  final VoidCallback onSignIn;

  const SignInForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onSignIn,
    this.onForgotPassword,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: emailController,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          validator: Validators.email,
        ),

        SizedBox(height: 15.h),

        AppTextField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: true,
          validator: Validators.password,
        ),

        SizedBox(height: 10.h),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: onForgotPassword,
            child: Text('Forgot Password', style: AppTextStyles.bodyLarge),
          ),
        ),

        SizedBox(height: 20.h),

        AppButton(
          text: 'Sign In',
          isLoading: isLoading,
          isFullWidth: true,
          onPressed: isLoading ? null : onSignIn,
        ),
      ],
    );
  }
}
