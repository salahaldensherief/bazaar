import 'package:Bazaar/features/cart/presentation/cubits/cart/cart_cubit.dart';
import 'package:Bazaar/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/getit/service_locator.dart';
import '../../../auth/data/models/sign_in_model.dart';
import '../../data/repos/cart_repo.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const routeName = 'cartview';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(
        cart: sl<CartRepo>(),
        user: sl<User>(),
      )..fetchCartItems()..checkout(),
      child: CartViewBody(),
    );
  }
}
