import 'package:Bazaar/core/utils/assets_images.dart';
import 'package:Bazaar/core/widgets/add_to_cart_container.dart';
import 'package:Bazaar/core/widgets/custom_app_bar.dart';
import 'package:Bazaar/features/cart/presentation/views/widgets/payment_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/cart/cart_cubit.dart';
import 'order_summary_view.dart';

class PaymentMethodView extends StatelessWidget {
  PaymentMethodView({super.key});

  static const routeName = 'payment-method';
  final ValueNotifier<bool> isCODSelected = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBack: true, title: 'Payment Method'),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
        child: AddToCartContainer(
          icon: '',
          title: 'Confirm Payment Process',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<CartCubit>(),
                  child: const OrderSummaryView(),
                ),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder<bool>(
          valueListenable: isCODSelected,
          builder: (context, value, child) {
            return Column(
              children: [
                PaymentOptionWidget(
                  title: 'Cash On Delivery',
                  icon: AssetsData.cash,
                  isSelected: value,
                  onTap: () => isCODSelected.value = true,
                ),
                PaymentOptionWidget(
                  title: 'Debit / Credit Card',
                  icon: AssetsData.card,
                  isSelected: !value,
                  onTap: () => isCODSelected.value = false,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
