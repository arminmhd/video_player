import 'package:get_it/get_it.dart';
import 'package:movie_stream_app/features/navigation/presentation/bloc/navigation_bloc.dart';

final sl = GetIt.instance;

Future<void> initNavigationDependencies() async {
  sl.registerFactory<NavigationBloc>(() => NavigationBloc());
}
