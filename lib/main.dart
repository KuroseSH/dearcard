import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

// final helloWorldProvider = Provider((_) => "Hello World");

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      title: "DearCard",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(
        title: "Dear Card APP",
      ),
    );
  }
}

final counterProvider = StateProvider<int>((ref) => 0);

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}

class HomePage extends ConsumerWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
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
