import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery/data/models/category.dart';
import 'package:grocery/data/models/promo.dart';
import 'package:grocery/presentation/helper/loading/loading_screen.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/dimensions.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/admin/category/components/item_add_category.dart';
import 'package:grocery/presentation/screens/admin/category/detail_category_screen.dart';
import 'package:grocery/presentation/screens/category/category_detail_screen.dart';
import 'package:grocery/presentation/screens/shop/components/box_search.dart';
import 'package:grocery/presentation/screens/shop/components/item_category.dart';
import 'package:grocery/presentation/screens/shop/components/item_promo.dart';
import 'package:grocery/presentation/services/category_bloc/category_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(GetCategories());
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icLogo,
                      width: 35,
                      height: 35,
                    ),
                    const Spacer(),
                    Text(
                      'Categories',
                      style: AppStyles.bold.copyWith(fontSize: 18),
                    ),
                    const Spacer(),
                    const Icon(
                      FontAwesomeIcons.bell,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //list categories
              _categories(size),
            ],
          ),
        ),
      ),
    );
  }

  navigateToDetailCategoryScreen(Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailCategoryScreen(category: category),
      ),
    );
  }

  _categories(Size size) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return LoadingScreen().showLoadingWidget();
        } else if (state is CategoryLoaded) {
          List<Category> categories = state.categories;
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
            ),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemCount: categories.length + 1,
              itemBuilder: (context, index) {
                if (index == categories.length) {
                  return ItemAddCategory(index: index);
                }
                Category category = categories[index];
                return ItemCategory(
                  category: category,
                  onTap: () => navigateToDetailCategoryScreen(
                    category,
                  ),
                );
              },
            ),
          );
        }
        return LoadingScreen().showLoadingWidget();
      },
    );
  }
}
