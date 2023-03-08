import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery/data/models/category.dart';
import 'package:grocery/data/models/promo.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/dimensions.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/category/category_detail_screen.dart';
import 'package:grocery/presentation/screens/shop/components/box_search.dart';
import 'package:grocery/presentation/screens/shop/components/item_category.dart';
import 'package:grocery/presentation/screens/shop/components/item_promo.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<Category> categories = [
    Category(name: 'Vegetables', image: AppAssets.icVegetables),
    Category(name: 'Fruits', image: AppAssets.icFruits),
    Category(name: 'Meat', image: AppAssets.icMeat),
    Category(name: 'Seafood', image: AppAssets.icSeaFood),
    Category(name: 'Milk & Egg', image: AppAssets.icMilkEgg),
    Category(name: 'Bread', image: AppAssets.icBread),
    Category(name: 'Frozen', image: AppAssets.icFrozen),
    Category(name: 'Organic', image: AppAssets.icOrganic),
  ];

  final List<Promo> promos = [
    Promo(image: AppAssets.promo1),
    Promo(image: AppAssets.promo2),
    Promo(image: AppAssets.promo3),
  ];
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  navigateToDetailCategory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CategoryDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: BoxSearch(
                      controller: searchController,
                      hintText: 'Search for products',
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Icon(
                    FontAwesomeIcons.bell,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: Text(
                'What are you looking for?',
                style: AppStyles.bold.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            //list categories
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1 / 1.3,
                  mainAxisSpacing: 5,
                  mainAxisExtent: size.width * .28,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  Category category = categories[index];
                  return ItemCategory(
                    category: category,
                    onTap: navigateToDetailCategory,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: Text(
                'Promos for you',
                style: AppStyles.bold.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(height: 15),
            // list promos
            SizedBox(
              height: size.height * .15,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Promo promo = promos[index];
                  return ItemPromo(promo: promo);
                },
                itemCount: promos.length,
              ),
            )
          ],
        ),
      )),
    );
  }
}
