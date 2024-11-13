import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_ufs/controller/getall_products_controller.dart';
import 'package:shopping_app_ufs/model/product_model.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  GetProductsBloc() : super(GetProductsInitial()) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(GetProductsLoading());
      try {
        emit(GetProductsSuccess(
            proData: await GetallProductsController.getAllProducts()));
      } catch (e) {
        emit(GetProductsError(error: e.toString()));
      }
    });
   
  }
}
