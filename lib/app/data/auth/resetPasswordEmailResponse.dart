/// status : true
/// message : "We have e-mailed your password reset link!"

class ResetPasswordEmailModel {
  bool? status;
  String? message;
  int? code;

  ResetPasswordEmailModel({
    this.status,
    this.message,
    this.code,
  });

  ResetPasswordEmailModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }

  ResetPasswordEmailModel copyWith({
    bool? status,
    String? message,
    int? code,
  }) =>
      ResetPasswordEmailModel(
        status: status ?? this.status,
        message: message ?? this.message,
        code: code ?? this.code,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['code'] = code;
    return map;
  }
}
