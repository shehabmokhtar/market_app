class SignInModel {
  String? userId;
  dynamic role;
  dynamic token;
  dynamic message;

  SignInModel({this.userId, this.role, this.token, this.message});

  SignInModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    role = json['role'];
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['role'] = role;
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}
