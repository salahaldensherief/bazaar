import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../auth/data/models/sign_in_model.dart';
import '../../../data/cart_item.dart';
import '../../../data/repos/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cart;
  final User user;

  CartCubit({required this.cart, required this.user}) : super(CartInitial());

  Future<void> _handleCartResult(result) async {
    result.fold(
          (error) => emit(CartFailure(message: error.errorModel.message)),
          (items) {
        if (items.isEmpty) {
          emit(CartEmpty());
        } else {
          final total = calculateCartTotal(items);
          emit(CartSuccess(cartItems: items, total: total.toDouble()));
        }
      },
    );
  }

  Future<void> fetchCartItems() async {
    emit(CartLoading());
    final result = await cart.getCartItems();
    await _handleCartResult(result);
  }

  Future<void> addToCart(String productId) async {
    emit(CartLoading());
    final result = await cart.addToCart(productId: productId);
    await _handleCartResult(result);
  }

  Future<void> removeFromCart(String cartItemId) async {
    emit(CartLoading());
    final result = await cart.removeFromCart(cartItemId: cartItemId);
    await _handleCartResult(result);
  }

  Future<void> checkout() async {
    if (state is! CartSuccess) return;

    emit(CartLoading());
    final cartItems = (state as CartSuccess).cartItems;

    final result = await cart.checkout(user: user, items: cartItems);
    result.fold(
          (error) => emit(CartFailure(message: error.errorModel.message)),
          (_) => emit(CartCheckoutSuccess()),
    );
  }

  double calculateCartTotal(List<CartItem> items) {
    return items.fold(0, (sum, item) {
      final price = item.product.discountedPrice ?? 0;
      return sum + (price * item.quantity);
    });
  }

  void updateQuantity(String cartItemId, int newQuantity) {
    if (state is CartSuccess) {
      final currentState = state as CartSuccess;
      final updatedItems = currentState.cartItems.map((item) {
        if (item.id == cartItemId) {
          return CartItem(
            id: item.id,
            product: item.product,
            quantity: newQuantity,
          );
        }
        return item;
      }).toList();

      final total = calculateCartTotal(updatedItems);
      emit(CartSuccess(cartItems: updatedItems, total: total.toDouble()));
    }
  }
}
