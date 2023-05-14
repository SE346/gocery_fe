part of 'category_detail_bloc.dart';

abstract class CategoryDetailState extends Equatable {
  const CategoryDetailState();

  @override
  List<Object> get props => [];
}

class CategoryDetailInitial extends CategoryDetailState {}

class CategoryDetailLoading extends CategoryDetailState {}

class CategoryDetailFailure extends CategoryDetailState {
  final String errorMessage;

  const CategoryDetailFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class CategoryDetailSuccess extends CategoryDetailState {
  final List<Product> products;

  const CategoryDetailSuccess({required this.products});

  @override
  List<Object> get props => [products];
}
