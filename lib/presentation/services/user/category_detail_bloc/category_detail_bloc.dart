import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
    on<CategoryDetailProductsFiltered>(_onFiltered);
    on<TextSearchChanged>(_onChanged);
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

  FutureOr<void> _onSorted(
      CategoryDetailProductsSorted event, Emitter<CategoryDetailState> emit) {
    emit(CategoryDetailLoading());

    if (event.type == 'Highest Price') {
      products.sort((product1, product2) {
        double tmp1, tmp2 = 0;

        tmp1 = product1.discount == 0
            ? product1.price.toDouble()
            : product1.price * (100 - product1.discount) * 0.01;
        tmp2 = product2.discount == 0
            ? product2.price.toDouble()
            : product2.price * (100 - product2.discount) * 0.01;

        return tmp2.compareTo(tmp1);
      });
    } else {
      products.sort((product1, product2) {
        double tmp1, tmp2 = 0;

        tmp1 = product1.discount == 0
            ? product1.price.toDouble()
            : product1.price * (100 - product1.discount) * 0.01;
        tmp2 = product2.discount == 0
            ? product2.price.toDouble()
            : product2.price * (100 - product2.discount) * 0.01;

        return tmp1.compareTo(tmp2);
      });
    }

    emit(CategoryDetailSuccess(products: [...products]));
  }

  FutureOr<void> _onFiltered(
      CategoryDetailProductsFiltered event, Emitter<CategoryDetailState> emit) {
    List<Product> tmp = [];

    for (var product in products) {
      double price = 0;

      price = product.discount == 0
          ? product.price.toDouble()
          : product.price * (100 - product.discount) * 0.01;
      if (price >= event.min && price <= event.max) {
        tmp.add(product);
      }
    }

    emit(CategoryDetailSuccess(products: [...tmp]));
  }

  FutureOr<void> _onChanged(
      TextSearchChanged event, Emitter<CategoryDetailState> emit) async {
    emit(CategoryDetailLoading());

    try {
      List<Product>? result =
          await _productRepository.searchProductsByIDCategory(
        event.idCategory,
        event.keyword,
      );
      products = result!;
      emit(CategoryDetailSuccess(products: products));
    } catch (e) {
      emit(CategoryDetailFailure(errorMessage: e.toString()));
    }
  }
}
