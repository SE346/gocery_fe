import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery/data/models/comment.dart';
import 'package:grocery/data/models/product.dart';
import 'package:grocery/data/models/user.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/dimensions.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/checkout/review_order_screen.dart';
import 'package:grocery/presentation/screens/review/review_screen.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';
import 'package:grocery/presentation/widgets/edit_product_cart.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final CarouselController controller = CarouselController();
  int currentIndex = 0;

  final List<Product> productSuggestions = [
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(
        actions: [
          Icon(
            Icons.favorite_outline_outlined,
            color: AppColors.primary,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.share,
            color: AppColors.primary,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          // list images
          listImages(),
          // name
          Padding(
            padding: const EdgeInsets.only(
              left: kPaddingHorizontal,
              top: 15,
            ),
            child: Text(
              widget.product.name,
              style: AppStyles.bold.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          // unit
          Padding(
            padding: const EdgeInsets.only(left: kPaddingHorizontal),
            child: Text(
              '${widget.product.unit}/pack',
              style: AppStyles.regular.copyWith(
                color: AppColors.gray,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 15),
          // price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              children: [
                Text(
                  '\$${widget.product.price}',
                  style: AppStyles.medium.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                const Spacer(),
                const EditProductCart(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
              vertical: 5,
            ),
            child: Divider(
              color: AppColors.gray,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
            ),
            child: Text(
              'Product Description',
              style: AppStyles.bold.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
            ),
            child: Text(
              widget.product.description,
              style: AppStyles.regular,
            ),
          ),
          reviews(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
            ),
            child: Text(
              'Maybe you like',
              style: AppStyles.bold.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          listRecommendation(size),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: const Color(0xFF000000).withOpacity(0.1),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.38),
                    border: Border.all(
                      color: const Color(0xFF000000).withOpacity(0.12),
                    ),
                  ),
                  child: Image.asset(
                    AppAssets.icCart,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CustomButton(
                    margin: 0,
                    content: 'Buy \$5.40',
                    onTap: navigateToReviewOrderScreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToReviewOrderScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ReviewOrderScreen(),
      ),
    );
  }

  void navigateToReviewScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ReviewScreen(
          comments: widget.product.comments,
        ),
      ),
    );
  }

  Widget listRecommendation(Size size) {
    return SizedBox(
      height: size.height * .12,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productSuggestions.length,
        itemBuilder: (context, index) {
          Product product = productSuggestions[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Image.asset(
              product.images[0],
              fit: BoxFit.fitWidth,
              width: 113,
              height: 113,
            ),
          );
        },
      ),
    );
  }

  Widget reviews() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kPaddingHorizontal,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review',
                style: AppStyles.bold.copyWith(
                  fontSize: 16,
                ),
              ),
              RatingBar.builder(
                initialRating: widget.product.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemPadding: const EdgeInsets.only(right: 5.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: AppColors.secondary,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: navigateToReviewScreen,
            child: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.gray,
              size: 18,
            ),
          )
        ],
      ),
    );
  }

  Widget listImages() {
    return Container(
      color: const Color(0xFFF5F6F6),
      child: Stack(
        children: [
          CarouselSlider(
            items: widget.product.images
                .map(
                  (item) => Image.asset(
                    item,
                    fit: BoxFit.fitHeight,
                    width: double.infinity,
                  ),
                )
                .toList(),
            carouselController: controller,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 1.7,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.product.images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => controller.animateToPage(entry.key),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? AppColors.primary
                          : AppColors.primary.withOpacity(0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}