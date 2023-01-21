import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_shop_app/data/product_data.dart';
import 'package:simple_shop_app/model/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<OnProductEventCalled>((event, emit) async {
      emit(ProductLoading());
      await Future.delayed(Duration(seconds: 3));
      emit(ProductLoaded(productsData));
    });
  }
}
