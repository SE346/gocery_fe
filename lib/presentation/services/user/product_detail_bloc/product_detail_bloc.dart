import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/cart.dart';
import 'package:grocery/data/models/comment.dart';
import 'package:grocery/data/models/review.dart';
import 'package:grocery/data/repository/cart_repository.dart';
import 'package:grocery/data/repository/product_repository.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final CartRepository _cartRepository;
  final ProductRepository _productRepository;

  int quantity = 0;
  int totalQuantity = 0;
  double price = 0;
  double rating = 0;
  List<Comment> comments = [];

  ProductDetailBloc(
    this._cartRepository,
    this._productRepository,
  ) : super(ProductDetailInitial()) {
    on<ProductDetailStarted>(_onStarted);
    on<ProductDetailAdded>(_onAdded);
    on<ProductDetailRemoved>(_onRemoved);
    on<ProductAddedToCart>(_onAddedToCart);
  }

  FutureOr<void> _onStarted(
      ProductDetailStarted event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoading());
    if (event.discountPrice == 0) {
      price = event.originalPrice.toDouble();
    } else {
      price = event.originalPrice * (100 - event.discountPrice) * 0.01;
    }

    try {
      Review? review = await _productRepository.getReviews(event.idProduct);

      if (review != null) {
        rating = review.rating;
        comments = review.comments;
      }

      emit(
        ProductDetailLoaded(
          quantity: quantity,
          price: price,
          totalQuantity: totalQuantity,
          rating: rating,
          comments: comments,
        ),
      );
    } catch (e) {
      emit(ProductDetailLoaded(
        quantity: 0,
        price: price,
        totalQuantity: 0,
        rating: rating,
        comments: comments,
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
        rating: rating,
        comments: comments,
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
        rating: rating,
        comments: comments,
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
