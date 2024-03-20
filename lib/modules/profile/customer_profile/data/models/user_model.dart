class UserModel {
  String? id;
  String? userId;
  String? registerationDate;
  String? fullName;
  String? phoneNumber;
  String? fcmToken;
  String? email;
  bool? isActive;

  UserModel(
      {this.id,
      this.userId,
      this.registerationDate,
      this.fullName,
      this.phoneNumber,
      this.fcmToken,
      this.email,
      this.isActive});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    userId = json['userId'] ?? '';
    registerationDate = json['registerationDate'] ?? '';
    fullName = json['fullName'] ?? '';
    phoneNumber = json['phoneNumber'] ?? 'Unavailable';
    fcmToken = json['fcmToken'] ?? '';
    email = json['email'] ?? '';
    isActive = json['isActive'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['registerationDate'] = registerationDate;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['fcmToken'] = fcmToken;
    data['email'] = email;
    data['isActive'] = isActive;
    return data;
  }
}
