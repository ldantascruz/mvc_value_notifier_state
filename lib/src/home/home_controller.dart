import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:value_notifier_state/src/home/home_state.dart';

import '../../models/dog_model.dart';

class HomeController {
  Dio client = Dio();

  ValueNotifier<HomeState> state = ValueNotifier(HomeStateEmpty());

  Future<void> getDog() async {
    state.value = HomeStateLoading();
    try {
      final response = await client.fetch(
        RequestOptions(path: 'https://dog.ceo/api/breeds/image/random'),
      );

      final dog = Dog.fromMap(response.data);

      state.value = HomeStateSuccess(dog: dog);
    } catch (e) {
      state.value = HomeStateError(error: e.toString());
    }
  }

  void dispose() {
    state.dispose();
  }
}
