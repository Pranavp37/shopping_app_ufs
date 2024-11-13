import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_delect_event.dart';
part 'product_delect_state.dart';

class ProductDelectBloc extends Bloc<ProductDelectEvent, ProductDelectState> {
  ProductDelectBloc() : super(ProductDelectInitial()) {
    on<ProductdeleteEvent>((event, emit) {

      try{
        emit(ProductDelectSucces());
      }catch(e){
        
      }
      
    });
  }
}
