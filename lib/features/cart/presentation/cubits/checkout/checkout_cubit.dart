import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../../core/services/errors/exceptions.dart';
import '../../../../home/data/repos/home_repo.dart';
import '../../../data/cart_response.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
}
