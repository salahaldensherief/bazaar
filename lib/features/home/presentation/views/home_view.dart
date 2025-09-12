import 'package:Bazaar/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/getit/service_locator.dart' as di;
import '../../data/repos/home_repo_impl.dart';
import '../manger/products/products_cubit.dart';
import '../manger/wishList/wish_list_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'homeview';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
         di.sl<ProductsCubit>()
            ..getProducts(),
        ),
        BlocProvider(
          create: (context) => di.sl<WishlistCubit>(),
        ),
      ],
      child: const HomeViewBody(),
    );
  }
}
