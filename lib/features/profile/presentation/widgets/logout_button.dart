import 'package:flutter/material.dart';
import 'package:movie_stream_app/features/profile/presentation/widgets/profile_section_tile.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSectionTile(icon: Icons.logout, title: 'Log Out');
  }
}
