import 'package:bloc/bloc.dart';
import 'package:mega_top/features/home/presentation/manger/wishList/wish_list_state.dart';
import '../../../data/repos/home_repo.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final HomeRepo homeRepo;
  final List<String> _favoriteIds = [];

  WishlistCubit({required this.homeRepo}) : super(WishlistInitial());

  Future<void> fetchWishlist() async {
    emit(WishlistLoading());
    final result = await homeRepo.getWishlist();
    result.fold(
          (error) =>  emit(WishlistEmpty()),
          (products) {
        if (products.isEmpty) {

        } else {
          emit(WishlistSuccess(products));
        }
      },
    );
  }

  Future<void> addToWishlist(String productId) async {
    emit(WishlistLoading());
    final result = await homeRepo.addProductToWishlist(id: productId);
    result.fold(
      (error) =>
          emit(WishlistError(error.errorModel.message ?? "Unknown error")),
      (wishlist) => emit(WishlistSuccess(wishlist)),
    );
  }

  Future<void> toggleFavorite(String productId) async {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
      await homeRepo.addProductToWishlist(id: productId);
    }

    emit(ProductFavoriteUpdated(List.from(_favoriteIds)));
  }

  bool isFavorite(String productId) {
    return _favoriteIds.contains(productId);
  }
}

//   Future<void> removeFromWishlist(String productId) async {
//     emit(WishlistLoading());
//     final result = await homeRepo.removeProductFromWishList(productId);
//     result.fold(
//           (error) => emit(WishlistError(error.errorModel.message ?? "Unknown error")),
//           (wishlist) => emit(WishlistLoaded(wishlist)),
//     );
//   }
// }
