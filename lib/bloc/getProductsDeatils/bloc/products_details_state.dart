part of 'products_details_bloc.dart';

sealed class ProductsDetailsState extends Equatable {
  const ProductsDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductsDetailsInitial extends ProductsDetailsState {}

final class ProductsDetailsLoading extends ProductsDetailsState {}

final class ProductsDetailsSuccess extends ProductsDetailsState {
  final ProductModel? proData;
  const ProductsDetailsSuccess({required this.proData});
  @override
  List<Object> get props => [proData!];
}

final class ProductsDetailsError extends ProductsDetailsState {
  final String error;
  const ProductsDetailsError({required this.error});
  @override
  List<Object> get props => [error];
}
