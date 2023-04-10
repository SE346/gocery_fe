import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery/data/models/category.dart';
import 'package:grocery/data/models/comment.dart';
import 'package:grocery/data/models/product.dart';
import 'package:grocery/data/models/user.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/admin/category/components/detele_category_dialog.dart';
import 'package:grocery/presentation/screens/admin/category/edit_category_screen.dart';
import 'package:grocery/presentation/screens/admin/product/product_screen.dart';
import 'package:grocery/presentation/screens/category/components/item_product.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/item_image.dart';
import 'package:grocery/presentation/widgets/text_field_input.dart';

class DetailCategoryScreen extends StatefulWidget {
  final Category category;

  const DetailCategoryScreen({
    super.key,
    required this.category,
  });

  @override
  State<DetailCategoryScreen> createState() => _DetailCategoryScreenState();
}

class _DetailCategoryScreenState extends State<DetailCategoryScreen> {
  final TextEditingController nameController = TextEditingController();

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
  void initState() {
    super.initState();
    nameController.text = widget.category.name;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        isCenterTitle: true,
        title: Text(
          widget.category.name,
          style: AppStyles.bold.copyWith(
            fontSize: 19,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: navigateToEditCategoryScreen,
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                FontAwesomeIcons.penToSquare,
                size: 20,
                color: AppColors.text,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => deleteCategory(context),
            child: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                FontAwesomeIcons.trashCan,
                size: 20,
                color: AppColors.text,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                TextFieldInput(
                  hintText: 'Name Category',
                  controller: nameController,
                ),
                const SizedBox(height: 10),
                Text(
                  'Display Image',
                  style: AppStyles.medium.copyWith(),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      AppAssets.icVegetables,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Products',
                      style: AppStyles.medium.copyWith(),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductScreen(products: products),
                          ),
                        );
                      },
                      child: Image.asset(AppAssets.icArrowRight),
                    )
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      Product product = products[index];
                      return GestureDetector(
                        onTap: () => {},
                        child: ItemProduct(
                          product: product,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  deleteCategory(BuildContext context) async {
    final bool? result = await showDialog(
      context: context,
      builder: (_) {
        return DeleteCategoryDialog(
          category: widget.category,
        );
      },
    );
    if (result != null) {
      Navigator.pop(context);
    }
  }

  void navigateToEditCategoryScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditCategoryScreen(
          category: widget.category,
        ),
      ),
    );
  }
}
