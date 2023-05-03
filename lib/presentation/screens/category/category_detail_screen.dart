import 'package:flutter/material.dart';
import 'package:grocery/data/models/comment.dart';
import 'package:grocery/data/models/product.dart';
import 'package:grocery/data/models/user.dart';
import 'package:grocery/presentation/res/dimensions.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/screens/category/components/item_product.dart';
import 'package:grocery/presentation/screens/category/components/sort_filter.dart';
import 'package:grocery/presentation/screens/products/product_detail_screen.dart';
import 'package:grocery/presentation/screens/shop/components/box_search.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<Product> products = [];
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  navigateToProductDetailScreen(Product product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPaddingHorizontal,
        ),
        child: Stack(
          children: [
            GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return GestureDetector(
                  onTap: () => navigateToProductDetailScreen(product),
                  child: ItemProduct(
                    product: product,
                  ),
                );
              },
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: SortFilter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
