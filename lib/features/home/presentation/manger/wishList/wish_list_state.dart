import 'package:equatable/equatable.dart';
import 'package:mega_top/features/home/data/model/products_model.dart';

class WishlistState extends Equatable {
  final List<ProductsModel> wishlist;

  const WishlistState({this.wishlist = const []});

  WishlistState copyWith({List<ProductsModel>? wishlist}) {
    return WishlistState(
      wishlist: wishlist ?? this.wishlist,
    );
  }

  @override
  List<Object?> get props => [wishlist];
}