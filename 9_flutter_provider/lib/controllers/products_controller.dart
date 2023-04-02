import 'package:_flutter_provider/use_cases/products/get_products.dart';

class ProductsController {
  final List<String> _products = GetProducts().call();

  List<String> get products => _products;
}
