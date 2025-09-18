part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartItem> cartItems;

  CartSuccess({required this.cartItems});
}

class CartEmpty extends CartState {}

class CartFailure extends CartState {
  final String message;
  CartFailure({required this.message});
}
