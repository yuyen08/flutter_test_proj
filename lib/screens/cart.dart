import 'package:carolinaproj/models/cart_model.dart';
import 'package:carolinaproj/shared/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {

  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartdata = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('\$${cartdata.totalAmount}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          )
        ],
      ),
      body: const CartList()
    );
  }
}