import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/features/profile/presentation/widgets/profile_section_tile.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.card,
      ),

      child: Column(
        children: [
          ProfileSectionTile(icon: Icons.edit, title: 'Edit Profile'),
          SizedBox(height: 12.h),
          ProfileSectionTile(icon: Icons.settings, title: 'App Settings'),
          SizedBox(height: 12.h),
          ProfileSectionTile(icon: Icons.abc_outlined, title: 'About App'),
        ],
      ),
    );
  }
}
