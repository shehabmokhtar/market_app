class CategoryModel {
  int? id;
  String? branchId;
  String? categoryId;
  dynamic branch;
  Category? category;

  CategoryModel(
      {this.id, this.branchId, this.categoryId, this.branch, this.category});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branchId'];
    categoryId = json['categoryId'];
    branch = json['branch'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['branchId'] = branchId;
    data['categoryId'] = categoryId;
    data['branch'] = branch;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  String? id;
  String? enName;
  String? trName;
  String? arName;
  String? imageUrl;

  Category({this.id, this.enName, this.trName, this.arName, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enName = json['enName'];
    trName = json['trName'];
    arName = json['arName'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enName'] = enName;
    data['trName'] = trName;
    data['arName'] = arName;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
