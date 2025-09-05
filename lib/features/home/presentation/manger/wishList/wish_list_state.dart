import 'package:meta/meta.dart';
import '../../../data/model/wishlist_response.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final WishlistResponse wishlist;

  WishlistLoaded(this.wishlist);
}

class WishlistError extends WishlistState {
  final String message;

  WishlistError(this.message);
}
