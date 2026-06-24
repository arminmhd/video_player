import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final VoidCallback onSettingsPressed;
  final String? imageUrl;
  final String name;
  final String email;
  const ProfileHeader({
    super.key,
    required this.onSettingsPressed,
    this.imageUrl,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Profile', style: Theme.of(context).textTheme.titleLarge),
            IconButton(
              onPressed: onSettingsPressed,
              icon: Icon(Icons.settings),
            ),
          ],
        ),

        SizedBox(height: 32.h),

        CircleAvatar(
          radius: 40.r,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: imageUrl == null ? Icon(Icons.person, size: 55.sp) : null,
        ),

        SizedBox(height: 16.h),

        Text(name, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 5.h),
        Text(email, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
