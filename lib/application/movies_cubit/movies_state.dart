part of 'movies_cubit.dart';


abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MovieLoaded extends MoviesState {
  final MovieModel movieModel;

  const MovieLoaded(this.movieModel);
  @override
  List<Object> get props => [movieModel];
}
class PopularMoviesLoaded extends MoviesState {
  final MovieListModel movieListModel;

  const PopularMoviesLoaded(this.movieListModel);
  @override
  List<Object> get props => [movieListModel];
}


class MoviesFailed extends MoviesState {
  final dynamic error;

  const MoviesFailed(this.error);

  @override
  List<Object> get props => [error];
}
