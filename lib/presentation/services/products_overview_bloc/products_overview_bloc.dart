import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/models/product.dart';

part 'products_overview_event.dart';
part 'products_overview_state.dart';

class ProductsOverviewBloc
    extends Bloc<ProductsOverviewEvent, ProductsOverviewState> {
  List<Product> products = [];

  ProductsOverviewBloc() : super(ProductsOverviewInitial()) {
    on<ProductsOverviewStarted>((event, emit) {
      products = event.products;
      emit(ProductsOverviewSuccess(products: products));
    });
    on<NewProductAdded>((event, emit) {
      products.add(event.product);
      emit(ProductsOverviewSuccess(products: products));
    });
  }
}
