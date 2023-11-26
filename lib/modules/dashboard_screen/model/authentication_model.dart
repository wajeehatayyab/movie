class AuthenticationModel {
  AuthenticationModel({
      this.success, 
      this.expiresAt, 
      this.requestToken,});

  AuthenticationModel.fromJson(dynamic json) {
    success = json['success'];
    expiresAt = json['expires_at'];
    requestToken = json['request_token'];
  }
  bool? success;
  String? expiresAt;
  String? requestToken;
AuthenticationModel copyWith({  bool? success,
  String? expiresAt,
  String? requestToken,
}) => AuthenticationModel(  success: success ?? this.success,
  expiresAt: expiresAt ?? this.expiresAt,
  requestToken: requestToken ?? this.requestToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['expires_at'] = expiresAt;
    map['request_token'] = requestToken;
    return map;
  }

}