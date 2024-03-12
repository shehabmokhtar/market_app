class CountryModel {
  String? enName;
  String? arName;
  String? trName;
  String? countryIsoCode;
  String? countryCode;
  String? id;
  String? createdAt;

  CountryModel(
      {this.enName,
      this.arName,
      this.trName,
      this.countryIsoCode,
      this.countryCode,
      this.id,
      this.createdAt});

  CountryModel.fromJson(Map<String, dynamic> json) {
    enName = json['enName'] ?? json['enName'].toString();
    arName = json['arName'] ?? json['arName'].toString();
    trName = json['trName'] ?? json['trName'].toString();
    countryIsoCode =
        json['countryIsoCode'] ?? json['countryIsoCode'].toString();
    countryCode = json['countryCode'] ?? json['countryCode'].toString();
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enName'] = enName;
    data['arName'] = arName;
    data['trName'] = trName;
    data['countryIsoCode'] = countryIsoCode;
    data['countryCode'] = countryCode;
    data['id'] = id;
    data['createdAt'] = createdAt;
    return data;
  }
}
