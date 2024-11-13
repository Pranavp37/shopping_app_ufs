part of 'post_products_bloc.dart';

class PostProductsState extends Equatable {
  const PostProductsState();

  @override
  List<Object> get props => [];
}

final class PostProductsInitial extends PostProductsState {}

final class PostProductsLoading extends PostProductsState {}

final class PostProductsSuccess extends PostProductsState {}

final class PostProductsError extends PostProductsState {
  final String error;
  const PostProductsError({required this.error});
  @override
  List<Object> get props => [error];
}
