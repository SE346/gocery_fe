part of 'detail_category_bloc.dart';

abstract class DetailCategoryEvent extends Equatable {
  const DetailCategoryEvent();

  @override
  List<Object> get props => [];
}

class DeleteCategorySubmitted extends DetailCategoryEvent {
  final int id;
  const DeleteCategorySubmitted({required this.id});

  @override
  List<Object> get props => [id];
}

class DetailCategoryStarted extends DetailCategoryEvent {
  final Category category;
  const DetailCategoryStarted({required this.category});

  @override
  List<Object> get props => [category];
}

class NewCategoryEditted extends DetailCategoryEvent {
  final Category category;
  const NewCategoryEditted({required this.category});

  @override
  List<Object> get props => [category];
}
