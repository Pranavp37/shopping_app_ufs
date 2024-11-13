import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_ufs/controller/post_produts_controller.dart';
import 'package:shopping_app_ufs/model/product_model.dart';

part 'post_products_event.dart';
part 'post_products_state.dart';

class PostProductsBloc extends Bloc<PostProductsEvent, PostProductsState> {
  PostProductsBloc() : super(PostProductsInitial()) {
    on<PostProductsDataEvent>((event, emit) {
      emit(PostProductsLoading());
      try {
        PostProdutsController.postDatatoApi(postData: event.postData);
        
        emit(PostProductsSuccess());
      } catch (e) {
        emit(PostProductsError(error: e.toString()));
      }
    });
  }
}
