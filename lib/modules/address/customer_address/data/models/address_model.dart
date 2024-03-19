class AddressModel {
  String? fullAddress;
  double? lat;
  double? lng;
  String? additionalInfo;
  String? apartment;
  String? floor;
  int? flatNumber;
  String? countryId;
  String? cityId;
  String? districtId;
  String? subDistrictId;

  AddressModel(
      {required this.fullAddress,
      required this.lat,
      required this.lng,
      required this.additionalInfo,
      required this.apartment,
      required this.floor,
      required this.flatNumber,
      required this.countryId,
      required this.cityId,
      required this.districtId,
      required this.subDistrictId});

  AddressModel.fromJson(Map<String, dynamic> json) {
    fullAddress = json['fullAddress'] ?? json['fullAddress'].toString();
    lat = json['lat'] ?? 0;
    lng = json['lng'] ?? 0;
    additionalInfo =
        json['additionalInfo'] ?? json['additionalInfo'].toString();
    apartment = json['apartment'] ?? json['apartment'].toString();
    floor = json['floor'] ?? 0;
    flatNumber = json['flatNumber'] ?? 0;
    countryId = json['countryId'] ?? json['countryId'].toString();
    cityId = json['cityId'] ?? json['cityId'].toString();
    districtId = json['districtId'] ?? json['districtId'].toString();
    subDistrictId = json['subDistrictId'] ?? json['subDistrictId'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullAddress'] = fullAddress;
    data['lat'] = lat;
    data['lng'] = lng;
    data['additionalInfo'] = additionalInfo;
    data['apartment'] = apartment;
    data['floor'] = floor;
    data['flatNumber'] = flatNumber;
    data['countryId'] = countryId;
    data['cityId'] = cityId;
    data['districtId'] = districtId;
    data['subDistrictId'] = subDistrictId;
    return data;
  }

  void display() {
    print('Full Address: $fullAddress');
    print('Latitude: $lat');
    print('Longitude: $lng');
    print('Additional Info: $additionalInfo');
    print('Apartment: $apartment');
    print('Floor: $floor');
    print('Flat Number: $flatNumber');
    print('Country ID: $countryId');
    print('City ID: $cityId');
    print('District ID: $districtId');
    print('Sub District ID: $subDistrictId');
  }
}
