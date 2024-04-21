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
  BranchProduct? branchProduct;
  String? addedAt;

  BasketProducts({this.id, this.quantity, this.branchProduct, this.addedAt});

  BasketProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['id'].toString();
    quantity = json['quantity'] ?? json['quantity'].toString();
    branchProduct = json['branchProduct'] != null
        ? BranchProduct.fromJson(json['branchProduct'])
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

class BranchProduct {
  int? id;
  int? stock;
  int? price;
  int? discountValue;
  int? discountTypes;
  Product? product;

  BranchProduct(
      {this.id,
      this.stock,
      this.price,
      this.discountValue,
      this.discountTypes,
      this.product});

  BranchProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    stock = json['stock'] ?? 0;
    price = json['price'] ?? 0;
    discountValue = json['discountValue'] ?? 0;
    discountTypes = json['discountTypes'] ?? 0;
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stock'] = stock;
    data['price'] = price;
    data['discountValue'] = discountValue;
    data['discountTypes'] = discountTypes;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? enName;
  String? arName;
  String? trName;
  String? enDescription;
  String? trDescription;
  String? arDescription;
  String? createdAt;
  String? manufacturer;
  String? updatedAt;
  String? subCategoryId;
  List<String>? images;

  Product(
      {this.id,
      this.enName,
      this.arName,
      this.trName,
      this.enDescription,
      this.trDescription,
      this.arDescription,
      this.createdAt,
      this.manufacturer,
      this.updatedAt,
      this.subCategoryId,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['id'].toString();
    enName = json['enName'] ?? json['id'].toString();
    arName = json['arName'] ?? json['arName'].toString();
    trName = json['trName'] ?? json['trName'].toString();
    enDescription = json['enDescription'] ?? json['enDescription'].toString();
    trDescription = json['trDescription'] ?? json['trDescription'].toString();
    arDescription = json['arDescription'] ?? json['arDescription'].toString();
    createdAt = json['createdAt'] ?? json['createdAt'].toString();
    manufacturer = json['createdAt'] ?? json['createdAt'].toString();
    updatedAt = json['updatedAt'] ?? json['updatedAt'].toString();
    subCategoryId = json['subCategoryId'] ?? json['subCategoryId'].toString();
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enName'] = enName;
    data['arName'] = arName;
    data['trName'] = trName;
    data['enDescription'] = enDescription;
    data['trDescription'] = trDescription;
    data['arDescription'] = arDescription;
    data['createdAt'] = createdAt;
    data['manufacturer'] = manufacturer;
    data['updatedAt'] = updatedAt;
    data['subCategoryId'] = subCategoryId;
    data['images'] = images;
    return data;
  }
}
