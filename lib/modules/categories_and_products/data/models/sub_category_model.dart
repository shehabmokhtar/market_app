class SubCategoriesAndProductsModel {
  int? id;
  bool? isEnabled;
  String? subCategory;
  List<BranchProducts>? branchProducts;

  SubCategoriesAndProductsModel(
      {this.id, this.isEnabled, this.subCategory, this.branchProducts});

  SubCategoriesAndProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isEnabled = json['isEnabled'];
    subCategory = json['subCategory'];
    if (json['branchProducts'] != null) {
      branchProducts = <BranchProducts>[];
      json['branchProducts'].forEach((v) {
        branchProducts!.add(BranchProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isEnabled'] = isEnabled;
    data['subCategory'] = subCategory;
    if (branchProducts != null) {
      data['branchProducts'] = branchProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BranchProducts {
  int? id;
  int? stock;
  int? price;
  int? discountValue;
  int? discountTypes;
  Product? product;

  BranchProducts(
      {this.id,
      this.stock,
      this.price,
      this.discountValue,
      this.discountTypes,
      this.product});

  BranchProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stock = json['stock'];
    price = json['price'];
    discountValue = json['discountValue'];
    discountTypes = json['discountTypes'];
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
    id = json['id'];
    enName = json['enName'];
    arName = json['arName'];
    trName = json['trName'];
    enDescription = json['enDescription'];
    trDescription = json['trDescription'];
    arDescription = json['arDescription'];
    createdAt = json['createdAt'];
    manufacturer = json['manufacturer'];
    updatedAt = json['updatedAt'];
    subCategoryId = json['subCategoryId'];
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
