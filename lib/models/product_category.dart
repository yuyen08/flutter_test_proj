import 'package:carolinaproj/models/product.dart';

class ProductCategory {
  final String title;
  // final String price;
  final String img;

  final List<Product> products;

  ProductCategory({required this.title, required this.img, required this.products});
}