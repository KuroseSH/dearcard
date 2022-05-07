import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dearcard/top.dart';
import 'package:dearcard/game.dart';

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
      debugShowCheckedModeBanner: false,
      title: "DearCard",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: 
      // Navigator(
      //   pages:[
          // TopPage(
          //   title: "Dear Card APP",
          // ),
          GamePage(),
      // ],)
    );
  }
}
