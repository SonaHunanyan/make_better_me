import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

extension BlocTransform on Bloc {
  /// This method will transform some of bloc event streams.
  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  EventTransformer<T> delay<T>(Duration duration) {
    return (events, mapper) => events.delay(duration).flatMap(mapper);
  }

  EventTransformer<T> throttleTime<T>(Duration duration) {
    return (events, mapper) => events.throttleTime(duration).flatMap(mapper);
  }
}