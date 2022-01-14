import 'package:carolinaproj/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final GlobalKey _listKey = GlobalKey();
  final List<Widget> cartitems = [];

  Widget _buildTile(CartItem item) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.description, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
          Text(item.size, style: TextStyle(fontSize: 15, color: Colors.grey[600])),
        ],
      ),
      leading: Text('${item.quantiy}', style: TextStyle(fontSize: 20, color: Colors.grey[600])),
      trailing: Text('\$${item.quantiy * item.price}', style: TextStyle(fontSize: 20, color: Colors.blue[900])),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartdata = Provider.of<CartModel>(context);
    for (CartItem item in cartdata.items) {
      cartitems.add(_buildTile(item));
    }

    return ListView.builder(
      key: _listKey,
      itemCount: cartitems.length,
      itemBuilder: (context, index) {
        return cartitems[index];
      });
  }
}