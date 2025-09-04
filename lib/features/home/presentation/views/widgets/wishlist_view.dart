import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(),
      appBar: CustomAppBar(
        title: 'Wishlist',
        showBack: true,
      ),
    );
  }
}
