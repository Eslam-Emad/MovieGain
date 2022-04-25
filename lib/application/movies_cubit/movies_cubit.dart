import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_gain/data/datasources/remote/movie_remote_datasource.dart';
import 'package:movie_gain/data/datasources/remote/popular_movies_remote_datasource.dart';
import 'package:movie_gain/data/models/movie_model.dart';
import 'package:movie_gain/data/models/movies_list_model.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final PopularMoviesRemoteDatasource popularMoviesRemoteDatasource;
  final MovieRemoteDatasource movieRemoteDatasource;

  MoviesCubit(this.popularMoviesRemoteDatasource, this.movieRemoteDatasource)
      : super(MoviesInitial());

  MovieListModel? popularMovies ;
  getPopularMovies() async {
    emit(MoviesLoading());
    try {
      final movies = await popularMoviesRemoteDatasource.getPopularMovies();
      popularMovies = movies;
      emit(PopularMoviesLoaded(movies));
    } catch (error) {
      emit(MoviesFailed(error));
    }
  }

  getMovieById(String id) async {
    emit(MoviesLoading());
    try {
      final movie = await movieRemoteDatasource.getMovieById(id);
      emit(MovieLoaded(movie));
    } catch (error) {
      emit(MoviesFailed(error));
    }
  }
}
