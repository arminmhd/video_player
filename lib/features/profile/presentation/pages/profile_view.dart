import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movie_stream_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:movie_stream_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:movie_stream_app/features/profile/presentation/bloc/profile_state.dart';
import 'package:movie_stream_app/features/profile/presentation/widgets/logout_button.dart';
import 'package:movie_stream_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:movie_stream_app/features/profile/presentation/widgets/profile_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ProfileLoaded) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                child: Column(
                  children: [
                    ProfileHeader(
                      onSettingsPressed: () {},
                      name: state.user.name ?? 'Unknown User',
                      email: state.user.email,
                      imageUrl: state.user.photoUrl,
                    ),
                    SizedBox(height: 25.h),
                    ProfileSection(),
                    SizedBox(height: 25.h),
                    LogoutButton(
                      onLogoutPressed: () {
                        context.read<AuthBloc>().add(SignOutRequested());
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}
