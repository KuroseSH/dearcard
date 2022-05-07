import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flip_card/flip_card.dart';

class GamePage extends ConsumerWidget {
  GamePage({
    Key? key,
    /*required this.title*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var list = [
      _cardItem("1"),
      _cardItem("2"),
      _cardItem("3"),
      _cardItem("4"),
      _cardItem("5"),
      _cardItem("6"),
      _cardItem("7"),
      _cardItem("8"),
      _cardItem("9"),
      _cardItem("10"),
      _cardItem("11"),
      _cardItem("12"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("aaa"),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
        shrinkWrap: true,
        children: list,
      ),
    );
  }

  Widget _cardItem(String title) {
    return FlipCard(
      front: Image.asset(
        'images/apple.jpeg',
        fit: BoxFit.cover,
      ),
      back: Text(title),
    );
  }
}
