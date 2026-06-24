import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/utils/validators.dart';
import 'package:movie_stream_app/core/widgets/app_button.dart';
import 'package:movie_stream_app/core/widgets/app_text_field.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final bool isLoading;
  final VoidCallback onSignUp;

  const SignUpForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSignUp,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: nameController,
          hintText: 'Full Name',
          validator: (p0) => Validators.required(p0),
        ),

        SizedBox(height: 15.h),

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

        SizedBox(height: 30.h),

        AppButton(
          text: 'Sign Up',
          isLoading: isLoading,
          isFullWidth: true,
          onPressed: isLoading ? null : onSignUp,
        ),
      ],
    );
  }
}
