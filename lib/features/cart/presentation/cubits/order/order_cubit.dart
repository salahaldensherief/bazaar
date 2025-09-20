import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../data/order_model.dart';
import '../../../data/repos/order_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo repository;

  OrderCubit({required this.repository}) : super(OrderInitial());

  Future<void> fetchOrders() async {
    emit(OrderLoading());
    final result = await repository.getOrders();

    result.fold(
          (error) => emit(OrderFailure(message: error.errorModel.message)),
          (orders) => emit(OrderSuccess(orders: orders)),
    );
  }
}
