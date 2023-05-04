import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/models/product.dart';

part 'products_overview_event.dart';
part 'products_overview_state.dart';

class ProductsOverviewBloc
    extends Bloc<ProductsOverviewEvent, ProductsOverviewState> {
  List<Product> products = [];

  ProductsOverviewBloc() : super(ProductsOverviewInitial()) {
    on<ProductsOverviewStarted>(_onStarted);
    on<NewProductAdded>(_onNewAdded);
  }

  FutureOr<void> _onNewAdded(event, emit) {
    emit(ProductsOverviewSuccess(products: [...products, event.product]));
  }

  FutureOr<void> _onStarted(event, emit) {
    products = event.products;
    emit(ProductsOverviewSuccess(products: products));
  }
}
