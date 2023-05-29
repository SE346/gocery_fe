import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/cart.dart';
import 'package:grocery/data/repository/cart_repository.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final CartRepository _cartRepository;

  int quantity = 0;
  int totalQuantity = 0;
  int price = 0;

  ProductDetailBloc(this._cartRepository) : super(ProductDetailInitial()) {
    on<ProductDetailStarted>(_onStarted);
    on<ProductDetailAdded>(_onAdded);
    on<ProductDetailRemoved>(_onRemoved);
    on<ProductAddedToCart>(_onAddedToCart);
  }

  FutureOr<void> _onStarted(
      ProductDetailStarted event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoading());
    if (event.discountPrice == 0) {
      price = event.originalPrice;
    } else {
      price = event.originalPrice * event.discountPrice ~/ 100;
    }

    try {
      // Cart? cart = await _cartRepository.getCartById(event.idProduct);
      // quantity = cart == null ? 0 : cart.quantity;
      List<Cart>? carts = await _cartRepository.getAllCarts();
      totalQuantity = carts!.length;
      emit(ProductDetailLoaded(
        quantity: quantity,
        price: price,
        totalQuantity: totalQuantity,
      ));
    } catch (e) {
      emit(ProductDetailLoaded(
        quantity: 0,
        price: price,
        totalQuantity: 0,
      ));
    }
  }

  FutureOr<void> _onAdded(
      ProductDetailAdded event, Emitter<ProductDetailState> emit) async {
    try {
      ++quantity;

      emit(ProductDetailLoaded(
        quantity: quantity,
        price: price,
        totalQuantity: totalQuantity,
      ));
    } catch (e) {
      emit(ProductDetailFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onRemoved(
      ProductDetailRemoved event, Emitter<ProductDetailState> emit) async {
    try {
      if (quantity > 0) {
        --quantity;
      }

      emit(ProductDetailLoaded(
        quantity: quantity,
        price: price,
        totalQuantity: totalQuantity,
      ));
    } catch (e) {
      emit(ProductDetailFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onAddedToCart(
      ProductAddedToCart event, Emitter<ProductDetailState> emit) async {
    try {
      await _cartRepository.addToCart(event.idProduct, event.quantity);
    } catch (e) {
      emit(ProductDetailFailure(errorMessage: e.toString()));
    }
  }
}
