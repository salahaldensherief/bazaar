import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top/features/home/presentation/views/widgets/home_view_body.dart';

import '../../../../core/services/api/dio_consumer.dart';
import '../../data/repos/home_repo_impl.dart';
import '../manger/products/products_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'homeview';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(HomeRepoImpl(api: DioConsumer(dio: Dio())))
            ..getProducts(),
      child: const HomeViewBody(),
    );
  }
}
