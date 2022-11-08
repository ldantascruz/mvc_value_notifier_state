import 'package:flutter/material.dart';

import '../../models/dog_model.dart';

abstract class HomeState {
  Widget when({
    required Widget Function(HomeStateEmpty) onEmpty,
    required Widget Function(HomeStateError) onError,
    required Widget Function(HomeStateLoading) onLoading,
    required Widget Function(HomeStateSuccess) onSuccess,
  }) {
    switch (runtimeType) {
      case HomeStateEmpty:
        return onEmpty(this as HomeStateEmpty);
      case HomeStateError:
        return onError(this as HomeStateError);
      case HomeStateLoading:
        return onLoading(this as HomeStateLoading);
      case HomeStateSuccess:
        return onSuccess(this as HomeStateSuccess);
      default:
        return onEmpty(this as HomeStateEmpty);
    }
  }

  void whenListen({
    Function(HomeStateEmpty)? onEmpty,
    Function(HomeStateError)? onError,
    Function(HomeStateLoading)? onLoading,
    Function(HomeStateSuccess)? onSuccess,
  }) {
    switch (runtimeType) {
      case HomeStateEmpty:
        if (onEmpty != null) onEmpty(this as HomeStateEmpty);
        break;
      case HomeStateError:
        if (onError != null) onError(this as HomeStateError);
        break;
      case HomeStateLoading:
        if (onLoading != null) onLoading(this as HomeStateLoading);
        break;
      case HomeStateSuccess:
        if (onSuccess != null) onSuccess(this as HomeStateSuccess);
        break;
      default:
        if (onEmpty != null) onEmpty(this as HomeStateEmpty);
        break;
    }
  }
}

class HomeStateEmpty extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final Dog dog;

  HomeStateSuccess({required this.dog});
}

class HomeStateError extends HomeState {
  final String error;

  HomeStateError({required this.error});
}
