import 'package:flutter/material.dart';
import 'package:mega_top/features/search/presentation/views/widgets/search_page_view_body.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});
static const String routeName = 'SearchPageView';
  @override
  Widget build(BuildContext context) {
    return SearchPageViewBody();
  }
}
