import 'package:carolinaproj/models/product.dart';
import 'package:carolinaproj/models/product_category.dart';
import 'package:carolinaproj/screens/details.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<Widget> _categoryTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addCategories();
  }

  void _addCategories() {
    List<ProductCategory> _categories = [
      ProductCategory(title: 'Laundry Detergent', img: 'beach.png', products: [
        Product(description: 'LLD Blue Fresh', size: 'Half Gallon', price: 160, img: 'city.png'),
        Product(description: 'LLD Blue Fresh', size: '1 Liter', price: 80, img: 'city.png'),
        Product(description: 'LLD Blue Fresh', size: '24 ounce', price: 40, img: 'city.png'),
        Product(description: 'Powdered LD BF', size: '8 ounce', price: 20, img: 'city.png')
      ]),

      ProductCategory(title: 'Dishwashing Liquid', img: 'city.png', products: [
        Product(description: 'Dishwashing Liquid', size: 'Half Gallon', price: 125, img: 'city.png'),
        Product(description: 'Dishwashing Liquid', size: '1 Liter', price: 65, img: 'city.png'),
        Product(description: 'Dishwashing Liquid', size: '24 ounce', price: 35, img: 'city.png'),
      ]),

      ProductCategory(title: 'Hand Soap', img: 'ski.png', products: [
        Product(description: 'Hand Soap', size: 'Half Gallon', price: 170, img: 'city.png'),
        Product(description: 'Hand Soap', size: '1 Liter', price: 85, img: 'city.png'),
        Product(description: 'Hand Soap', size: '24 ounce', price: 42.50, img: 'city.png'),
      ]),
    ];

    for (ProductCategory category in _categories) {
      _categoryTiles.add(_buildTile(category));
    }
  }

  Widget _buildTile(ProductCategory category) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(category: category)));
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text('${trip.nights} nights',
          //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue[300])),
          Text(category.title, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'location-img-${category.img}',
          child: Image.asset(
            'images/${category.img}',
            height: 50.0,
          ),
        ),
      ),
      // trailing: Text('\$${trip.price}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _categoryTiles.length,
        itemBuilder: (context, index) {
          return _categoryTiles[index];
        }
      );
  }
}