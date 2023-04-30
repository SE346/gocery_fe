import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/models/category.dart';
import 'package:grocery/data/repository/category_repository.dart';
import 'package:grocery/data/response/base_response.dart';

part 'detail_category_event.dart';
part 'detail_category_state.dart';

class DetailCategoryBloc
    extends Bloc<DetailCategoryEvent, DetailCategoryState> {
  final CategoryRepository categoryRepository;

  DetailCategoryBloc(this.categoryRepository)
      : super(const DetailCategoryInitial()) {
    on<DeleteCategorySubmitted>(_onSubmitted);
    on<NewCategoryEditted>(_onNewEditted);
    on<DetailCategoryStarted>(_onStarted);
  }

  void _onSubmitted(
      DeleteCategorySubmitted event, Emitter<DetailCategoryState> emit) async {
    emit(DetailCategoryLoading());

    try {
      BaseResponse baseResponse =
          await categoryRepository.deleteCategory(event.id);
      if (baseResponse.message == 'Delete successfully') {
        emit(DeleteCategorySuccess(idDeleted: event.id));
      } else {
        emit(
          DetailCategoryFailure(errorMessage: baseResponse.message!),
        );
      }
    } catch (e) {
      emit(DetailCategoryFailure(errorMessage: e.toString()));
    }
  }

  void _onNewEditted(
      NewCategoryEditted event, Emitter<DetailCategoryState> emit) {
    emit(EditCategorySuccess(category: event.category));
  }

  void _onStarted(
      DetailCategoryStarted event, Emitter<DetailCategoryState> emit) {
    emit(DetailCategoryInitial(category: event.category));
  }
}
