import 'package:Bazaar/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
static const routeName = 'cartview';
  @override
  Widget build(BuildContext context) {
    return  CartViewBody();
  }
}
