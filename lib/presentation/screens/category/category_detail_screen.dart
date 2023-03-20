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

  final List<Product> products = [
    Product(
      name: 'Pak Choi',
      images: [
        AppAssets.pakChoi,
        AppAssets.springOnion,
        AppAssets.carrot,
        AppAssets.pakChoi,
        AppAssets.greenPaprica,
        AppAssets.garlic,
        AppAssets.cabbage,
      ],
      unit: '50g',
      price: 2.20,
      hasDiscount: true,
      discount: 0.5,
      description:
          'Savoy cabbage is a type of Brassica oleracea plant. Savoy cabbage is a winter vegetable and one of several cabbage varieties. Estimated to be expected from England and the Netherlands. In the 18th century, he was introduced to Germany as "Savoyer Kohl". The name is taken from the Savoy Region in France.',
      rating: 5,
      comments: [
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
      ],
    ),
    Product(
      name: 'Spring Onion',
      images: [AppAssets.springOnion],
      unit: '30g',
      price: 0.8,
      hasDiscount: false,
      discount: 0.5,
      description:
          'Savoy cabbage is a type of Brassica oleracea plant. Savoy cabbage is a winter vegetable and one of several cabbage varieties. Estimated to be expected from England and the Netherlands. In the 18th century, he was introduced to Germany as "Savoyer Kohl". The name is taken from the Savoy Region in France.',
      rating: 5,
      comments: [
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
      ],
    ),
    Product(
      name: 'Carrot',
      images: [AppAssets.carrot],
      unit: '250g',
      price: 2.5,
      hasDiscount: false,
      discount: 0.5,
      description:
          'Savoy cabbage is a type of Brassica oleracea plant. Savoy cabbage is a winter vegetable and one of several cabbage varieties. Estimated to be expected from England and the Netherlands. In the 18th century, he was introduced to Germany as "Savoyer Kohl". The name is taken from the Savoy Region in France.',
      rating: 5,
      comments: [
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
      ],
    ),
    Product(
      name: 'Pak Choi',
      images: [AppAssets.pakChoi],
      unit: '50g',
      price: 1.10,
      hasDiscount: true,
      discount: 0.5,
      description:
          'Savoy cabbage is a type of Brassica oleracea plant. Savoy cabbage is a winter vegetable and one of several cabbage varieties. Estimated to be expected from England and the Netherlands. In the 18th century, he was introduced to Germany as "Savoyer Kohl". The name is taken from the Savoy Region in France.',
      rating: 5,
      comments: [
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
      ],
    ),
    Product(
      name: 'Green Paprica',
      images: [AppAssets.greenPaprica],
      unit: '300g',
      price: 2.20,
      hasDiscount: true,
      discount: 0.5,
      description:
          'Savoy cabbage is a type of Brassica oleracea plant. Savoy cabbage is a winter vegetable and one of several cabbage varieties. Estimated to be expected from England and the Netherlands. In the 18th century, he was introduced to Germany as "Savoyer Kohl". The name is taken from the Savoy Region in France.',
      rating: 5,
      comments: [
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
      ],
    ),
    Product(
      name: 'Garlic',
      images: [AppAssets.garlic],
      unit: '50g',
      price: 1.10,
      hasDiscount: false,
      discount: 0.5,
      description:
          'Savoy cabbage is a type of Brassica oleracea plant. Savoy cabbage is a winter vegetable and one of several cabbage varieties. Estimated to be expected from England and the Netherlands. In the 18th century, he was introduced to Germany as "Savoyer Kohl". The name is taken from the Savoy Region in France.',
      rating: 5,
      comments: [
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
      ],
    ),
    Product(
      name: 'Cabbage Savoy',
      images: [AppAssets.cabbage],
      unit: '1kg',
      price: 5.30,
      hasDiscount: true,
      discount: 0.5,
      description:
          'Savoy cabbage is a type of Brassica oleracea plant. Savoy cabbage is a winter vegetable and one of several cabbage varieties. Estimated to be expected from England and the Netherlands. In the 18th century, he was introduced to Germany as "Savoyer Kohl". The name is taken from the Savoy Region in France.',
      rating: 5,
      comments: [
        Comment(
          user: User(
            firstName: 'Tommy',
            lastName: 'Hung',
            avatar:
                'https://images.unsplash.com/photo-1678227999424-d20d2ea7726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
            mail: 'maiphamquochung@gmail.com',
            password: 'teoem2411',
          ),
          content: 'Nice',
        ),
      ],
    ),
  ];
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
