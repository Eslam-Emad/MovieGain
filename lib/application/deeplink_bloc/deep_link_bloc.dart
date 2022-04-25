import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'deep_link_event.dart';

part 'deep_link_state.dart';

class DeepLinkBloc extends Bloc<DeepLinkEvent, DeepLinkState> {
  static const _platform = MethodChannel("moviegain/channel");

  static const _stream = EventChannel('moviegain/events');

  DeepLinkBloc() : super(DeepLinkInitial()) {
    on<InitializeDeepLinkEvent>(_onInitializeDeepLinkEvent);
    on<DeepLinkChangeEvent>(_onDeepLinkChangeEvent);
    add(InitializeDeepLinkEvent());
    _stream.receiveBroadcastStream().listen(_onRedirected);
  }

  FutureOr<void> _onInitializeDeepLinkEvent(
      DeepLinkEvent event, Emitter<DeepLinkState> emit) async {
    emit(DeepLinkLoading());
    try {
      final url = await _platform.invokeMethod('initialLink');
      if (url.toString().contains("details")) {
        emit(DeepLinkDetailsMovie(_getMovieIdFromUrl(url)));
      } else {
        emit(DeepLinkStarted());
      }
    } on PlatformException catch (e) {
      emit(DeepLinkError(e.message.toString()));
    }
  }

  FutureOr<void> _onDeepLinkChangeEvent(
      DeepLinkChangeEvent event, Emitter<DeepLinkState> emit) {
    emit(DeepLinkLoading());

    if (event.url.toString().contains("details")) {
      emit(DeepLinkDetailsMovie(_getMovieIdFromUrl(event.url)));
    } else {
      emit(DeepLinkStarted());
    }
  }

  _onRedirected(url) => add(DeepLinkChangeEvent(url));

  String _getMovieIdFromUrl(String url) => url.split("/").last;
}
