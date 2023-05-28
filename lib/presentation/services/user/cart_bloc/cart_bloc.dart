import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/cart.dart';
import 'package:grocery/data/repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;

  List<Cart> carts = [];

  CartBloc(this._cartRepository) : super(CartInitial()) {
    on<CartStarted>(_onStarted);
    on<CartAdded>(_onAdded);
    on<CartRemoved>(_onRemoved);
  }

  FutureOr<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());

    try {
      List<Cart>? result = await _cartRepository.getAllCarts();
      carts = result ?? [];
      emit(CartLoaded(carts: [...carts]));
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onAdded(CartAdded event, Emitter<CartState> emit) async {
    try {
      Cart cart = event.cart.copyWith(quantity: event.cart.quantity + 1);
      await _cartRepository.addToCart(event.cart.product.id!, 1);
      int index = carts.indexOf(event.cart);
      carts.removeWhere((cart) => cart.product.id == event.cart.product.id);
      carts.insert(index, cart);
      emit(CartLoaded(carts: [...carts]));
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onRemoved(CartRemoved event, Emitter<CartState> emit) async {
    try {
      Cart cart = event.cart.copyWith(quantity: event.cart.quantity - 1);
      await _cartRepository.removeFromCart(event.cart.product.id!, 1);
      int index = carts.indexOf(event.cart);
      carts.removeWhere((cart) => cart.product.id == event.cart.product.id);
      if (cart.quantity != 0) {
        carts.insert(index, cart);
      }

      emit(CartLoaded(carts: [...carts]));
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }
}
