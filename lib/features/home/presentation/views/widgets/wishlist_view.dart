// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../core/widgets/custom_app_bar.dart';
// import '../../../../../core/widgets/products_view_grid.dart';
// import '../../../data/repos/home_repo.dart';
// import '../../../data/repos/home_repo_impl.dart';
// import '../../manger/wishList/wish_list_cubit.dart';
// import '../../manger/wishList/wish_list_state.dart' as wishState;
//
// class WishlistView extends StatelessWidget {
//   final HomeRepo homeRepo;
//
//   const WishlistView({super.key, required this.homeRepo});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => WishlistCubit(homeRepo: homeRepo)..fetchWishlist(),
//       child: Scaffold(
//         appBar: CustomAppBar(
//           title: 'Wishlist',
//           showBack: true,
//         ),
//         body: BlocBuilder<WishlistCubit, wishState.WishlistState>(
//           builder: (context, state) {
//             if (state is wishState.WishlistLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is wishState.WishlistError) {
//               return Center(child: Text(state.message));
//             } else if (state is wishState.WishlistLoaded) {
//               final wishlist = state.wishlist;
//               if (wishlist.items.isEmpty) {
//                 return const Center(child: Text('Your wishlist is empty'));
//               }
//               return GridView.builder(
//                 padding: const EdgeInsets.all(8),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 8,
//                   crossAxisSpacing: 8,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemCount: wishlist.items.length,
//                 itemBuilder: (context, index) {
//                   final product = wishlist.items[index];
//                   return ProductViewGrid(
//                     width: 150,
//                     height: 250,
//                     imageHeight: 120,
//                     product: product,
//                   );
//                 },
//               );
//             }
//             return const SizedBox.shrink();
//           },
//         ),
//       ),
//     );
//   }
// }
