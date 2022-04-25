part of 'deep_link_bloc.dart';

abstract class DeepLinkEvent extends Equatable {
  const DeepLinkEvent();

  @override
  List<Object?> get props => [];
}

class InitializeDeepLinkEvent extends DeepLinkEvent {}
class DeepLinkChangeEvent extends DeepLinkEvent {
  final String url;

  const DeepLinkChangeEvent(this.url);
  @override
  List<Object?> get props => [url];
}
