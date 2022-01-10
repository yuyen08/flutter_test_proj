import 'package:carolinaproj/models/product_category.dart';
import 'package:carolinaproj/shared/product_list.dart';
import 'package:flutter/material.dart';
// import 'package:lipsum/lipsum.dart' as lipsum;

class Details extends StatelessWidget {
  final ProductCategory category;

  const Details({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            child: Hero(
              tag: 'location-img-${category.img}',
              child: Image.asset(
                'images/${category.img}',
                height: 300,
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              category.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey[800]),
            ),
            subtitle: const Text(
              'Choose Size',
              style: TextStyle(letterSpacing: 1),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: ProductList(products: category.products))
          ),
        ],
      ),
    );
  }
}