import 'package:meta/meta.dart';
import '../../../data/model/products_model.dart';

@immutable
import 'package:meta/meta.dart';
import '../../../data/model/wishlist_item.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistSuccess extends WishlistState {
  final List<WishlistItem> wishlist;
  WishlistSuccess(this.wishlist);
}

class WishlistEmpty extends WishlistState {}

class WishlistError extends WishlistState {
  final String message;
  WishlistError(this.message);
}

class ProductFavoriteUpdated extends WishlistState {
  final List<String> favorites;
  ProductFavoriteUpdated(this.favorites);
}
