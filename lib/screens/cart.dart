import 'package:flutter/material.dart';

class Cart extends StatelessWidget {

  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          ListTile(
            title: Text('item cart 1'),
          ),
          ListTile(
            title: Text('item cart 2'),
          )
        ],
      ),
    );
  }
}