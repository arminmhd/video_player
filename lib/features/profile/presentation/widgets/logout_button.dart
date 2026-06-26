import 'package:flutter/material.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/features/profile/presentation/widgets/profile_section_tile.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback? onLogoutPressed;
  const LogoutButton({super.key, this.onLogoutPressed});

  @override
  Widget build(BuildContext context) {
    return ProfileSectionTile(
      icon: Icons.logout,
      title: 'Log Out',
      color: AppColors.primary,
      onTap: onLogoutPressed,
    );
  }
}
