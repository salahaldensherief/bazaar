// import 'package:bloc/bloc.dart';
// import 'package:mega_top/features/home/presentation/manger/wishList/wish_list_state.dart';
// import 'package:meta/meta.dart';
// import '../../../data/model/wishlist_response.dart';
// import '../../../data/repos/home_repo.dart';
//
// class WishlistCubit extends Cubit<WishlistState> {
//   final HomeRepo homeRepo;
//
//   WishlistCubit({required this.homeRepo}) : super(WishlistInitial());
//
//   // Fetch wishlist
//   Future<void> fetchWishlist() async {
//     emit(WishlistLoading());
//     final result = await homeRepo.fetchWishList();
//     result.fold(
//           // (error) => emit(WishlistError(error.errorModel.message)),
//           // (wishlist) => emit(WishlistLoaded(wishlist)),
//     // );
//   }
//
//   // Add product to wishlist
//   Future<void> addToWishlist(String productId) async {
//     emit(WishlistLoading());
//     final result = await homeRepo.addProductToWishList(productId);
//     result.fold(
//           (error) => emit(WishlistError(error.errorModel.message ?? "Unknown error")),
//           (wishlist) => emit(WishlistLoaded(wishlist)),
//     );
//   }
//
//   // Remove product from wishlist
//   Future<void> removeFromWishlist(String productId) async {
//     emit(WishlistLoading());
//     final result = await homeRepo.removeProductFromWishList(productId);
//     result.fold(
//           (error) => emit(WishlistError(error.errorModel.message ?? "Unknown error")),
//           (wishlist) => emit(WishlistLoaded(wishlist)),
//     );
//   }
// }
