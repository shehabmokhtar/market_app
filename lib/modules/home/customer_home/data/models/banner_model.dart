class BannerModel {
  int? id;
  String? imageUrl;
  int? bannerType;
  dynamic url;
  dynamic productId;
  bool? isActive;
  String? createdAt;

  BannerModel(
      {this.id,
      this.imageUrl,
      this.bannerType,
      this.url,
      this.productId,
      this.isActive,
      this.createdAt});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    bannerType = json['bannerType'];
    url = json['url'];
    productId = json['productId'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['bannerType'] = bannerType;
    data['url'] = url;
    data['productId'] = productId;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    return data;
  }
}
