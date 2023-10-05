/// status : true
/// message : "We have e-mailed your password reset link!"

class ResetPasswordEmailModel {
  ResetPasswordEmailModel({
    this.status,
    this.message,
  });

  ResetPasswordEmailModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }

  bool? status;
  String? message;

  ResetPasswordEmailModel copyWith({
    bool? status,
    String? message,
  }) =>
      ResetPasswordEmailModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}
