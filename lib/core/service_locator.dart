import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_gain/data/datasources/remote/movie_remote_datasource.dart';
import '../application/deeplink_bloc/deep_link_bloc.dart';
import '../application/movies_cubit/movies_cubit.dart';
import '../data/datasources/remote/popular_movies_remote_datasource.dart';
import 'SharedPreference/pereferences.dart';
import 'networking/dio_client.dart';

GetIt sl = GetIt.instance;

Future<void> setup() async {
  // Blocs
  sl.registerFactory(() => DeepLinkBloc());
  sl.registerFactory(() => MoviesCubit(sl(), sl()));

  // DataSources
  sl.registerLazySingleton(() => PopularMoviesRemoteDatasource(sl()));
  sl.registerLazySingleton(() => MovieRemoteDatasource(sl()));

  // External
  sl.registerLazySingleton(() => SharedPreferencesHelper());
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => Dio());
}
