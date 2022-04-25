part of 'deep_link_bloc.dart';

abstract class DeepLinkState extends Equatable {
  const DeepLinkState();

  @override
  List<Object> get props => [];
}

class DeepLinkInitial extends DeepLinkState {}

class DeepLinkStarted extends DeepLinkState {}
class DeepLinkLoading extends DeepLinkState {}

class DeepLinkDetailsMovie extends DeepLinkState {
  final String movieId;

  const DeepLinkDetailsMovie(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class DeepLinkError extends DeepLinkState {
  final String error;

  const DeepLinkError(this.error);

  @override
  List<Object> get props => [error];
}
