import 'package:flutter/material.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../basket/data/models/basket_model.dart';

class OrderProductItemWidget extends StatelessWidget {
  const OrderProductItemWidget({super.key, required this.basketProductModel});
  final BasketProductModel basketProductModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightGray),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Image.network(
              basketProductModel.branchProduct!.product!.images![0],
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${basketProductModel.branchProduct!.product!.enName}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text('Quantity: ${basketProductModel.quantity}'),
                const SizedBox(height: 5),
                Text('${basketProductModel.branchProduct!.price}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
