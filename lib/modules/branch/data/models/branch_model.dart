class BranchModel {
  String? id;
  String? enName;
  String? arName;
  String? trName;
  double? lat;
  double? lng;
  String? enDetailedAddress;
  String? arDetailedAddress;
  String? trDetailedAddress;
  int? deliveryFees;
  int? deliveryTime;
  int? minimumOrderValue;
  int? maximumCoverAreaInKM;
  bool? isOutsideDelivery;

  BranchModel(
      {this.id,
      this.enName,
      this.arName,
      this.trName,
      this.lat,
      this.lng,
      this.enDetailedAddress,
      this.arDetailedAddress,
      this.trDetailedAddress,
      this.deliveryFees,
      this.deliveryTime,
      this.minimumOrderValue,
      this.maximumCoverAreaInKM,
      this.isOutsideDelivery});

  BranchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enName = json['enName'];
    arName = json['arName'];
    trName = json['trName'];
    lat = json['lat'];
    lng = json['lng'];
    enDetailedAddress = json['enDetailedAddress'];
    arDetailedAddress = json['arDetailedAddress'];
    trDetailedAddress = json['trDetailedAddress'];
    deliveryFees = json['deliveryFees'];
    deliveryTime = json['deliveryTime'];
    minimumOrderValue = json['minimumOrderValue'];
    maximumCoverAreaInKM = json['maximumCoverAreaInKM'];
    isOutsideDelivery = json['isOutsideDelivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enName'] = enName;
    data['arName'] = arName;
    data['trName'] = trName;
    data['lat'] = lat;
    data['lng'] = lng;
    data['enDetailedAddress'] = enDetailedAddress;
    data['arDetailedAddress'] = arDetailedAddress;
    data['trDetailedAddress'] = trDetailedAddress;
    data['deliveryFees'] = deliveryFees;
    data['deliveryTime'] = deliveryTime;
    data['minimumOrderValue'] = minimumOrderValue;
    data['maximumCoverAreaInKM'] = maximumCoverAreaInKM;
    data['isOutsideDelivery'] = isOutsideDelivery;
    return data;
  }
}
