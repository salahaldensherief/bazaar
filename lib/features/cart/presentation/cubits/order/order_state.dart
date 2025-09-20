part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderLoading extends OrderState {}
class OrderSuccess extends OrderState {
  final List<OrderModel> orders;
  OrderSuccess({required this.orders});
}
class OrderFailure extends OrderState {
  final String message;
  OrderFailure({required this.message});
}
