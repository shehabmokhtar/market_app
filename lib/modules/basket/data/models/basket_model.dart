import 'package:market_app/modules/categories_and_products/data/models/sub_category_model.dart';

class BasketModel {
  String? id;
  String? customerId;
  String? userId;
  int? totalPrice;
  List<BasketProducts>? basketProducts;

  BasketModel(
      {this.id,
      this.customerId,
      this.userId,
      this.totalPrice,
      this.basketProducts});

  BasketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    userId = json['userId'];
    totalPrice = json['totalPrice'];
    if (json['basketProducts'] != null) {
      basketProducts = <BasketProducts>[];
      json['basketProducts'].forEach((v) {
        basketProducts!.add(BasketProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerId'] = customerId;
    data['userId'] = userId;
    data['totalPrice'] = totalPrice;
    if (basketProducts != null) {
      data['basketProducts'] = basketProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BasketProducts {
  int? id;
  int? quantity;
  BranchProducts? branchProduct;
  String? addedAt;

  BasketProducts({this.id, this.quantity, this.branchProduct, this.addedAt});

  BasketProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['id'].toString();
    quantity = json['quantity'] ?? json['quantity'].toString();
    branchProduct = json['branchProduct'] != null
        ? BranchProducts.fromJson(json['branchProduct'])
        : null;
    addedAt = json['addedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    if (branchProduct != null) {
      data['branchProduct'] = branchProduct!.toJson();
    }
    data['addedAt'] = addedAt;
    return data;
  }
}
