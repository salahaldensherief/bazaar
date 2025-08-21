// import 'package:flutter/material.dart';
// import 'package:mega_top/core/utils/assets_images.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final bool showBack;
//   final VoidCallback? onBack;
//  final bool centerTitle;
//
//   const CustomAppBar({
//     super.key,
//     required this.title,
//     this.showBack = false,
//     this.onBack, this.centerTitle= true,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: showBack
//               ? IconButton(
//             icon: Image.asset(AssetsData.backIcon),
//             onPressed: onBack ?? () => Navigator.of(context).pop(),
//           )
//               : null,
//           centerTitle: centerTitle,
//           title: Text(
//             title,
//             style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         Container(
//           height: 1,
//            decoration: BoxDecoration(
//              boxShadow: [
//                 BoxShadow(
//                    color: Colors.black.withOpacity(.3),
//                   spreadRadius: .01,
//                   offset: Offset(0, 2),
//                   blurRadius: 2,
//                   blurStyle: BlurStyle.normal
//
//                 )
//              ]
//            ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
// }
