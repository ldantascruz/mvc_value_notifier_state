import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'home_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getDog();
    controller.state.addListener(() {
      controller.state.value.whenListen(
        onEmpty: (_) {
          print('olá');
        },
        onLoading: (_) {
          print('loading state');
        },
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.state,
        builder: (context, value, _) {
          return controller.state.value.when(
            onEmpty: (_) {
              return const Center(
                child: Text('Nenhum valor encontrado.'),
              );
            },
            onError: (error) {
              return Center(
                child: Text(error.error),
              );
            },
            onLoading: (_) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            onSuccess: (success) {
              return Center(
                  child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(success.dog.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getDog(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
