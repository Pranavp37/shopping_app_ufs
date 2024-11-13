part of 'product_delect_bloc.dart';

class ProductDelectEvent extends Equatable {
  const ProductDelectEvent();

  @override
  List<Object> get props => [];
}

class ProductdeleteEvent extends ProductDelectEvent {
  final int id;

  const ProductdeleteEvent({required this.id});
  @override
  List<Object> get props => [id];
}
