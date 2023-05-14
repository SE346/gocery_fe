import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/models/product.dart';
import 'package:grocery/data/repository/product_repository.dart';

part 'category_detail_event.dart';
part 'category_detail_state.dart';

class CategoryDetailBloc
    extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  final ProductRepository _productRepository;
  List<Product> products = [];

  CategoryDetailBloc(this._productRepository) : super(CategoryDetailInitial()) {
    on<CategoryDetailProductsFetched>(_onProductsFetched);
    on<CategoryDetailProductsSorted>(_onSorted);
  }

  void _onProductsFetched(event, emit) async {
    emit(CategoryDetailLoading());

    try {
      List<Product>? result =
          await _productRepository.getProductsByIDCategory(event.idCategory);
      products = result!;
      emit(CategoryDetailSuccess(products: products));
    } catch (e) {
      emit(CategoryDetailFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onSorted(CategoryDetailProductsSorted event, Emitter<CategoryDetailState> emit) {
    if(event.type == 'Highest'){

    }else{
      
    }
  }
}
