part of 'products_overview_bloc.dart';

abstract class ProductsOverviewEvent {
  const ProductsOverviewEvent();
}

class ProductsOverviewStarted extends ProductsOverviewEvent {
  final List<Product> products;

  const ProductsOverviewStarted({required this.products});
}

class NewProductAdded extends ProductsOverviewEvent {
  final Product product;

  const NewProductAdded({required this.product});
}
