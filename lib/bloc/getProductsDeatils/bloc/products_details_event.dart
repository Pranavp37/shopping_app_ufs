part of 'products_details_bloc.dart';

class ProductsDetailsEvent extends Equatable {
  const ProductsDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsDetailsEvent extends ProductsDetailsEvent {
  final int id;
  const GetProductsDetailsEvent({required this.id});

  @override
  List<Object> get props => [];
}
