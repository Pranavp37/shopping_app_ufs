part of 'product_delect_bloc.dart';

sealed class ProductDelectState extends Equatable {
  const ProductDelectState();

  @override
  List<Object> get props => [];
}

final class ProductDelectInitial extends ProductDelectState {}

final class ProductDelectSucces extends ProductDelectState {}

final class ProductDelectError extends ProductDelectState {
  final String error;
  const ProductDelectError({required this.error});
}
