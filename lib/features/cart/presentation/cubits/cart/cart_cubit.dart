import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_item.dart';
import '../../../data/repos/cart_repo.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cart;
  CartCubit({required this.cart}) : super(CartInitial());

  Future<void> fetchCartItems() async {
    emit(CartLoading());
    final result = await cart.getCartItems();
    result.fold(
          (error) => emit(CartFailure(message: error.errorModel.message)),
          (items) => items.isEmpty ? emit(CartEmpty()) : emit(CartSuccess(cartItems: items)),
    );
  }

  Future<void> removeFromCart(String cartItemId) async {
    emit(CartLoading());
    final result = await cart.removeFromCart(cartItemId: cartItemId);
    result.fold(
          (error) => emit(CartFailure(message: error.errorModel.message)),
          (items) => items.isEmpty ? emit(CartEmpty()) : emit(CartSuccess(cartItems: items)),
    );
  }

  Future<void> addToCart(String productId) async {
    emit(CartLoading());
    final result = await cart.addToCart(productId: productId);
    result.fold(
          (error) => emit(CartFailure(message: error.errorModel.message)),
          (items) => items.isEmpty ? emit(CartEmpty()) : emit(CartSuccess(cartItems: items)),
    );
  }
}
