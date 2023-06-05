part of 'statistic_bloc.dart';

abstract class StatisticState extends Equatable {
  const StatisticState();

  @override
  List<Object> get props => [];
}

class StatisticInitial extends StatisticState {}

class StatisticLoading extends StatisticState {}

class StatisticFailure extends StatisticState {
  final String errorMessage;

  const StatisticFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class StatisticSuccess extends StatisticState {
  final double revenue;
  final int totalTransactions;
  final int totalFinish;
  final int totalInProgress;
  final int totalCancel;
  final int totalUsers;
  final int totalProducts;

  const StatisticSuccess({
    required this.revenue,
    required this.totalTransactions,
    required this.totalFinish,
    required this.totalInProgress,
    required this.totalCancel,
    required this.totalUsers,
    required this.totalProducts,
  });

  @override
  List<Object> get props => [
        revenue,
        totalTransactions,
        totalCancel,
        totalFinish,
        totalInProgress,
        totalProducts,
      ];
}
