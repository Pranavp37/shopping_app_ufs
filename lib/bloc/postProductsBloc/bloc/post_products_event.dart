part of 'post_products_bloc.dart';

class PostProductsEvent extends Equatable {
  const PostProductsEvent();

  @override
  List<Object> get props => [];
}

class PostProductsDataEvent extends PostProductsEvent {
  final ProductModel postData;
  const PostProductsDataEvent({required this.postData});
}
