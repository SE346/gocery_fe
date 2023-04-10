// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  final bool isLoading;
  final bool isAdd;
  
  CategoryLoaded({
    required this.categories,
    this.isLoading = false,
    this.isAdd = false,
  });
}
