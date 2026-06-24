import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/core/usecases/no_params.dart';
import 'package:movie_stream_app/features/auth/domain/usecases/current_user_use_case.dart';
import 'package:movie_stream_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:movie_stream_app/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final CurrentUserUseCase getCurrentUser;

  ProfileBloc({required this.getCurrentUser}) : super(const ProfileInitial()) {
    on<LoadProfileRequested>(_onLoadProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfileRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());
    try {
      final user = await getCurrentUser(NoParams());

      if (user == null) {
        emit(const ProfileError('Profile Error'));
        return;
      }

      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
