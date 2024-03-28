import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/basket_button.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/poduct/add_to_basket_widget.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/poduct/favorite_button_product_screen.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/poduct/recommended_for_you_widget.dart';

class CustomerProductScreen extends StatefulWidget {
  const CustomerProductScreen({super.key});

  @override
  State<CustomerProductScreen> createState() => _CustomerProductScreenState();
}

class _CustomerProductScreenState extends State<CustomerProductScreen> {
  bool _discriptionTextExpanded = false;
// Todo >>>>>>>>>>>
  final _images = List.generate(
    3,
    (index) => Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(.05),
          image: const DecorationImage(
            image: NetworkImage(
                'http://salahelden18-001-site1.atempurl.com/Products/92e171b9-f154-4e01-8342-4960e73a33b4_pngwing.com (1) (1).png'),
            fit: BoxFit.contain,
          )),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            // The product image
            SliverAppBar(
              elevation: 0,
              pinned: true,
              expandedHeight: 300,
              stretch: true,
              actions: [
                BasketButton(),
              ],
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: AppSizes.iconSize(context),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.blurBackground,
                ],
                // Todo >>>>>
                // background: ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemBuilder: (context, index) => _images[index],
                // ),
                background: _images[1],
              ),
            ),
            // Product body
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name
                    // Todo >>>>>>>>>
                    const Text(
                      'Product Name',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    // Product price
                    // Todo >>>>>>>>>
                    Text(
                      '20 TL',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppSizes.smallTextStyle(context).copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Product disc
                    // Todo >>>>>>>>>
                    InkWell(
                      onTap: () {
                        setState(() {
                          _discriptionTextExpanded = !_discriptionTextExpanded;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          'Product Name Product Name Product Name Product Name,Product Name Product Name Product Name Product Name,Product Name Product Name Product Name Product Name',
                          maxLines: _discriptionTextExpanded ? null : 2,
                          overflow: _discriptionTextExpanded
                              ? null
                              : TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Recommendted for you section
            const SliverToBoxAdapter(
              child: RecommendedForYouWidget(),
            ),
          ],
        ),
      ),
      // Cart button and favorite button
      bottomNavigationBar: const SafeArea(
        child: SizedBox(
          height: 65,
          child: Row(
            children: [
              AddToCartButton(),
              ProductScreenFavoriteButton(),
            ],
          ),
        ),
      ),
    );
  }
}
