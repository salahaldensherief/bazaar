part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartItem> cartItems;
  final double total;

  CartSuccess({required this.total,required this.cartItems});
}

class CartEmpty extends CartState {}

class CartFailure extends CartState {
  final String message;
  CartFailure({required this.message});

}
class CartCheckoutSuccess extends CartState {}