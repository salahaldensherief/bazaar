
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top/features/home/data/model/products_model.dart';
import 'package:mega_top/features/home/presentation/manger/wishList/wish_list_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(const WishlistState());

  /// إضافة منتج
  void addToWishlist(ProductsModel product) {
    final updatedList = List<ProductsModel>.from(state.wishlist)
      ..add(product);
    emit(state.copyWith(wishlist: updatedList));
  }

  /// حذف منتج
  void removeFromWishlist(ProductsModel product) {
    final updatedList = List<ProductsModel>.from(state.wishlist)
      ..removeWhere((item) => item.sId == product.sId);
    emit(state.copyWith(wishlist: updatedList));
  }

  /// هل المنتج موجود؟
  bool isInWishlist(ProductsModel product) {
    return state.wishlist.any((item) => item.sId == product.sId);
  }
}