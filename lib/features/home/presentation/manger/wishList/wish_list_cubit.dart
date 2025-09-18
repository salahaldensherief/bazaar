import 'package:Bazaar/features/home/data/model/wishlist_item.dart';
import 'package:Bazaar/features/home/presentation/manger/wishList/wish_list_state.dart';
import 'package:bloc/bloc.dart';
import '../../../data/repos/home_repo.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final HomeRepo homeRepo;

  WishlistCubit({required this.homeRepo}) : super(WishlistInitial());

  Future<void> fetchWishlist() async {
    emit(WishlistLoading());
    final result = await homeRepo.fetchWishlist();
    result.fold(
          (error) => emit(WishlistError(error.errorModel.message ?? "Unknown error")),
          (items) => items.isEmpty ? emit(WishlistEmpty()) : emit(WishlistSuccess(items)),
    );
  }

  Future<void> addToWishlist(String productId) async {
    emit(WishlistLoading());
    final result = await homeRepo.addProductToWishlist(id: productId);
    result.fold(
          (error) => emit(WishlistError(error.errorModel.message ?? "Unknown error")),
          (items) => items.isEmpty ? emit(WishlistEmpty()) : emit(WishlistSuccess(items.cast<WishlistItem>())),
    );
  }

  Future<void> removeFromWishlist(String wishlistItemId) async {
    if (state is WishlistSuccess) {
      final currentState = state as WishlistSuccess;
      final updatedList = currentState.wishlist
          .where((item) => item.sId != wishlistItemId)
          .toList();

      emit(updatedList.isEmpty ? WishlistEmpty() : WishlistSuccess(updatedList));
    }

    emit(WishlistLoading());
    final result = await homeRepo.removeProductFromWishList(wishlistItemId);
    result.fold(
          (error) => emit(WishlistError(error.errorModel.message ?? "Unknown error")),
          (items) => items.isEmpty ? emit(WishlistEmpty()) : emit(WishlistSuccess(items)),
    );
  }

  Future<void> toggleFavorite(String wishlistItemId) async {
    if (isFavorite(wishlistItemId)) {
      await removeFromWishlist(wishlistItemId);
    } else {
      await addToWishlist(wishlistItemId);
    }
  }

  bool isFavorite(String wishlistItemId) {
    if (state is WishlistSuccess) {
      return (state as WishlistSuccess).wishlist.any((item) => item.sId == wishlistItemId);
    }
    return false;
  }

}
