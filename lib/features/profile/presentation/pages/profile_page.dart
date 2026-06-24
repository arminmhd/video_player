import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/app/di/injection.dart';
import 'package:movie_stream_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:movie_stream_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:movie_stream_app/features/profile/presentation/pages/profile_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(const LoadProfileRequested()),
      child: ProfileView(),
    );
  }
}
