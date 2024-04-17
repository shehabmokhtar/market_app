import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/basket_button.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/categories_and_products/data/models/sub_category_model.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/poduct/add_to_basket_widget.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/poduct/favorite_button_product_screen.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/poduct/recommended_for_you_widget.dart';

class CustomerProductScreen extends StatefulWidget {
  final BranchProduct model;
  const CustomerProductScreen({super.key, required this.model});

  @override
  State<CustomerProductScreen> createState() => _CustomerProductScreenState();
}

class _CustomerProductScreenState extends State<CustomerProductScreen> {
  bool _discriptionTextExpanded = false;

  @override
  Widget build(BuildContext context) {
    final images = List.generate(
      widget.model.product!.images!.length,
      (index) => Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          image: DecorationImage(
            image:
                NetworkImage(widget.model.product!.images![index].toString()),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
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
              actions: const [
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
                background: Hero(tag: 'i', child: images[0]),
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
                    Text(
                      widget.model.product!.enName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    // Product price
                    Text(
                      widget.model.price.toString(),
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
                          widget.model.product!.enDescription!,
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
