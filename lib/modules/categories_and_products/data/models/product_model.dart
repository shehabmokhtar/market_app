class ProductModel {
  String? id;
  String? enName;
  String? arName;
  String? trName;
  String? enDescription;
  String? trDescription;
  String? arDescription;
  String? createdAt;
  dynamic manufacturer;
  dynamic updatedAt;
  dynamic subCategoryId;
  List<String>? images;

  ProductModel(
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

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 'Untitled';
    enName = json['enName'] ?? 'Untitled';
    arName = json['arName'] ?? 'Untitled';
    trName = json['trName'] ?? 'Untitled';
    enDescription = json['enDescription'] ?? 'Untitled';
    trDescription = json['trDescription'] ?? 'Untitled';
    arDescription = json['arDescription'] ?? 'Untitled';
    createdAt = json['createdAt'] ?? 'Untitled';
    manufacturer = json['manufacturer'] ?? 'Untitled';
    updatedAt = json['updatedAt'] ?? 'Untitled';
    subCategoryId = json['subCategoryId'].toString();
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
