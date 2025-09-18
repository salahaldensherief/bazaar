part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutSuccessMessage extends CheckoutState {
  final String message;
  CheckoutSuccessMessage(this.message);
}

class CheckoutFailure extends CheckoutState {
  final String message;
  CheckoutFailure(this.message);
}
