import 'package:flutter/material.dart';
import 'package:traden_app/models/category.dart';
import 'package:traden_app/pages/category_services.dart';
import 'package:traden_app/utilities/helper_functions.dart';
import 'category_card.dart';

class SearchTabView extends StatefulWidget {
  final List<Category> categories;
  SearchTabView({this.categories});

  @override
  _SearchTabViewState createState() => _SearchTabViewState();
}

class _SearchTabViewState extends State<SearchTabView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
          ),
          itemCount: widget.categories.length,
          itemBuilder: (buildContext, index) {
            var category = widget.categories[index];
            return CategoryCard(
              category: category,
              onTap: () => pushScreen(
                context,
                CategoryServicesList(category: category),
              ),
            );
          }),
    );
  }
}
