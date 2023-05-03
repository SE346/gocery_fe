// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_edit_product_bloc.dart';

abstract class AddEditProductState extends Equatable {
  const AddEditProductState();

  @override
  List<Object> get props => [];
}

class AddEditProductInitial extends AddEditProductState {
  final Product? product;

  const AddEditProductInitial({
    this.product,
  });
}

class AddEditProductLoading extends AddEditProductState {}

class AddEditProductSuccess extends AddEditProductState {
  final Product product;

  const AddEditProductSuccess({required this.product});
}

class AddEditProductFailure extends AddEditProductState {
  final String errorMessage;

  const AddEditProductFailure({required this.errorMessage});
}
