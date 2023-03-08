import 'package:flutter/material.dart';
import 'package:grocery/presentation/screens/shop/components/box_search.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: BoxSearch(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          controller: searchController,
          hintText: 'Search in this category',
        ),
      ),
    );
  }
}
