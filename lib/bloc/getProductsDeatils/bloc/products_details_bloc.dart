import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_ufs/controller/getdetails_product_controller.dart';
import 'package:shopping_app_ufs/model/product_model.dart';

part 'products_details_event.dart';
part 'products_details_state.dart';

class ProductsDetailsBloc
    extends Bloc<ProductsDetailsEvent, ProductsDetailsState> {
  ProductsDetailsBloc() : super(ProductsDetailsInitial()) {
    on<GetProductsDetailsEvent>((event, emit) async {
      emit(ProductsDetailsLoading());
      try {
        emit(ProductsDetailsSuccess(
            proData: await GetdetailsProductController.getDeatilsProducts(
                event.id.toString())));
      } catch (e) {
        emit(ProductsDetailsError(error: e.toString()));
      }
    });
  }
}
