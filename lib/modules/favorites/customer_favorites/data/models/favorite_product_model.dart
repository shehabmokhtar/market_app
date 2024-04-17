import 'package:market_app/modules/categories_and_products/data/models/sub_category_model.dart';

class FavoriteProductModel {
  String? id;
  String? addedAt;
  Product? product;

  FavoriteProductModel({this.id, this.addedAt, this.product});

  FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedAt = json['addedAt'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['addedAt'] = addedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
