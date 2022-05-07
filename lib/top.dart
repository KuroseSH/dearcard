import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}

class TopPage extends ConsumerWidget {
  TopPage({Key? key, required this.title}) : super(key: key);
  final String title;

  int _counter = 0;
  void _incrementCounte() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("sample Text aaa"),
            Text(
              ref.watch(counterProvider).toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton.icon(
                onPressed: null,
                icon: Icon(Icons.ac_unit),
                label: Text("ゲーム画面へ"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.watch(counterProvider.state).state++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );

    // final count = ref.watch(counterProvider);
    // return Text('$count');
  }
}
