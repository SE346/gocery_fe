part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailFailure extends ProductDetailState {
  final String errorMessage;

  const ProductDetailFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ProductDetailLoaded extends ProductDetailState {
  final int quantity;
  final double price;
  final int totalQuantity;
  final double rating;
  final List<Comment> comments;

  const ProductDetailLoaded(
      {required this.quantity,
      required this.price,
      required this.totalQuantity,
      required this.comments,
      required this.rating});

  @override
  List<Object> get props => [
        quantity,
        price,
        totalQuantity,
        rating,
        comments,
      ];
}
