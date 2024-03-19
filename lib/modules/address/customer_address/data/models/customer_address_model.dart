class CustomerAddressModel {
  String? id;
  String? fullAddress;
  double? lat;
  double? lng;
  String? additionalInfo;
  String? apartment;
  String? floor;
  int? flatNumber;
  Country? country;
  City? city;
  City? district;
  City? subDistrict;

  CustomerAddressModel(
      {this.id,
      this.fullAddress,
      this.lat,
      this.lng,
      this.additionalInfo,
      this.apartment,
      this.floor,
      this.flatNumber,
      this.country,
      this.city,
      this.district,
      this.subDistrict});

  CustomerAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullAddress = json['fullAddress'];
    lat = json['lat'];
    lng = json['lng'];
    additionalInfo = json['additionalInfo'];
    apartment = json['apartment'];
    floor = json['floor'];
    flatNumber = json['flatNumber'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    district =
        json['district'] != null ? City.fromJson(json['district']) : null;
    subDistrict =
        json['subDistrict'] != null ? City.fromJson(json['subDistrict']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullAddress'] = fullAddress;
    data['lat'] = lat;
    data['lng'] = lng;
    data['additionalInfo'] = additionalInfo;
    data['apartment'] = apartment;
    data['floor'] = floor;
    data['flatNumber'] = flatNumber;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (subDistrict != null) {
      data['subDistrict'] = subDistrict!.toJson();
    }
    return data;
  }
}

class Country {
  String? enName;
  String? arName;
  String? trName;
  String? countryIsoCode;
  String? countryCode;
  String? id;
  String? createdAt;

  Country(
      {this.enName,
      this.arName,
      this.trName,
      this.countryIsoCode,
      this.countryCode,
      this.id,
      this.createdAt});

  Country.fromJson(Map<String, dynamic> json) {
    enName = json['enName'];
    arName = json['arName'];
    trName = json['trName'];
    countryIsoCode = json['countryIsoCode'];
    countryCode = json['countryCode'];
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

class City {
  String? enName;
  String? arName;
  String? trName;
  String? countryIsoCode;
  String? countryCode;
  String? id;
  String? createdAt;

  City(
      {this.enName,
      this.arName,
      this.trName,
      this.countryIsoCode,
      this.countryCode,
      this.id,
      this.createdAt});

  City.fromJson(Map<String, dynamic> json) {
    enName = json['enName'];
    arName = json['arName'];
    trName = json['trName'];
    countryIsoCode = json['countryIsoCode'];
    countryCode = json['countryCode'];
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
