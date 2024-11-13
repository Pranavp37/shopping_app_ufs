part of 'get_products_bloc.dart';

class GetProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

class GetProductsSuccess extends GetProductsState {
  final List<ProductModel>? proData;
  GetProductsSuccess({required this.proData});
  @override
  List<Object?> get props => [proData];
}

final class GetProductsError extends GetProductsState {
  final String error;
  GetProductsError({required this.error});
  @override
  List<Object?> get props => [error];
}
