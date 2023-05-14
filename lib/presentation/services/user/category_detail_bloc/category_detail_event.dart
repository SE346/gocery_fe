part of 'category_detail_bloc.dart';

abstract class CategoryDetailEvent extends Equatable {
  const CategoryDetailEvent();

  @override
  List<Object> get props => [];
}

class CategoryDetailProductsFetched extends CategoryDetailEvent {
  final int idCategory;

  const CategoryDetailProductsFetched({required this.idCategory});

  @override
  List<Object> get props => [idCategory];
}

class CategoryDetailProductsSorted extends CategoryDetailEvent {
  final String type;

  const CategoryDetailProductsSorted({required this.type});

  @override
  List<Object> get props => [type];
}
