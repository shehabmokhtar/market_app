class SubCategoriesAndProductsModel {
  int? id;
  bool? isEnabled;
  SubCategory? subCategory;
  List<BranchProducts>? branchProducts;

  SubCategoriesAndProductsModel({
    this.id,
    this.isEnabled,
    this.subCategory,
    this.branchProducts,
  });

  SubCategoriesAndProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    isEnabled = json['isEnabled'] ?? false;
    subCategory = json['subCategory'] != null
        ? SubCategory.fromJson(json['subCategory'])
        : null;
    branchProducts = json['branchProducts'] != null
        ? List<BranchProducts>.from(
            json['branchProducts'].map((x) => BranchProducts.fromJson(x)))
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isEnabled'] = isEnabled;
    if (subCategory != null) {
      data['subCategory'] = subCategory!.toJson();
    }
    data['branchProducts'] = branchProducts!.map((x) => x.toJson()).toList();
    return data;
  }
}

class SubCategory {
  String? id;
  String? enName;
  String? trName;
  String? arName;
  String? categoryId;

  SubCategory({
    this.id,
    this.enName,
    this.trName,
    this.arName,
    this.categoryId,
  });

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    enName = json['enName'] ?? '';
    trName = json['trName'] ?? '';
    arName = json['arName'] ?? '';
    categoryId = json['categoryId'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enName'] = enName;
    data['trName'] = trName;
    data['arName'] = arName;
    data['categoryId'] = categoryId;
    return data;
  }
}

class BranchProducts {
  int? id;
  int? stock;
  dynamic price;
  dynamic discountValue;
  dynamic discountTypes;
  Product? product;

  BranchProducts({
    this.id,
    this.stock,
    this.price,
    this.discountValue,
    this.discountTypes,
    this.product,
  });

  BranchProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    stock = json['stock'] ?? 0;
    price = json['price'] ?? 0.0;
    discountValue = json['discountValue'] ?? 0.0;
    discountTypes = json['discountTypes'] ?? 0.0;
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

  Product({
    this.id,
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
    this.images,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    enName = json['enName'] ?? '';
    arName = json['arName'] ?? '';
    trName = json['trName'] ?? '';
    enDescription = json['enDescription'] ?? '';
    trDescription = json['trDescription'] ?? '';
    arDescription = json['arDescription'] ?? '';
    createdAt = json['createdAt'] ?? '';
    manufacturer = json['manufacturer'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
    subCategoryId = json['subCategoryId'] ?? '';
    images = json['images'] != null
        ? List<String>.from(json['images'].map((x) => x))
        : [];
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
