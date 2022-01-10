import 'package:carolinaproj/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartdata = Provider.of<CartModel>(context);
    final cartitems = cartdata.items;
    return Container();
  }
}