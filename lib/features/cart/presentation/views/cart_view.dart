import 'package:flutter/material.dart';
import 'package:mega_top/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
static const routeName = 'cartview';
  @override
  Widget build(BuildContext context) {
    return  CartViewBody();
  }
}
