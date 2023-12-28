class SignUpModel {
  String? userId;
  String? message;

  SignUpModel({this.userId, this.message});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['message'] = message;
    return data;
  }
}
