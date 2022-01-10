import 'package:carolinaproj/models/product.dart';
import 'package:carolinaproj/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Widget> _productTiles = [];
  final GlobalKey _listKey = GlobalKey();
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    _addProducts();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _addProducts() {
    for (Product product in widget.products) {
      _productTiles.add(_buildTile(product));
    }
  }

  Future<String?> openDialog(String dialogTitle) => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(dialogTitle),
        content: TextField(
          autofocus: true, keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(hintText: 'Enter Qty'),
          controller: controller,
        ),
        actions: [
          TextButton(onPressed: submit, child: const Text('SUBMIT'))
        ],
      ));

  void submit() {
    Navigator.of(context).pop(controller.text);
  }

  Widget _buildTile(Product product) {
    return TextButton(
      onPressed: () async {
        final quantity = await openDialog(product.size);
        if (quantity == null || quantity.isEmpty) return;
        controller.clear();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'images/${product.img}',
                  height: 50.0,
                ),
              ),
              Text(product.size, style: TextStyle(fontSize: 12, color: Colors.red[800])),
              Text('\$${product.price}', style: const TextStyle(fontSize: 17, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
    /*return ListTile(
      contentPadding: const EdgeInsets.all(25),
      *//*title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(product.description, style: TextStyle(fontSize: 8, color: Colors.grey[800])),
          Text(product.size, style: TextStyle(fontSize: 16, color: Colors.grey[800]))
        ],
      ),*//*
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'images/${product.img}',
          height: 50.0,
        ),
      ),
      trailing: Text('\$${product.price}', style: TextStyle(fontSize: 15, color: Colors.grey[600])),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return
      GridView.count(
        crossAxisCount: 3,
        children: List.generate(_productTiles.length, (index) {
          return _productTiles[index];
        }),
      );
      /*ListView.builder(
      key: _listKey,
      itemCount: _productTiles.length,
      itemBuilder: (context, index) {
          return _productTiles[index];
      }
    );*/
  }
}