/// message : "The password field is required. (and 2 more errors)"
/// errors : {"password":["The password field is required."],"code":["The code field must be at least 4 characters."],"email":["The email field is required."]}

class SetNewPasswordModel {
  bool? status;
  String? message;
  Errors? errors;

  SetNewPasswordModel({
    this.status,
    this.message,
    this.errors,
  });

  SetNewPasswordModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  SetNewPasswordModel copyWith({
    bool? status,
    String? message,
    Errors? errors,
  }) =>
      SetNewPasswordModel(
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }
}

/// password : ["The password field is required."]
/// code : ["The code field must be at least 4 characters."]
/// email : ["The email field is required."]

class Errors {
  List<String>? password;
  List<String>? code;
  List<String>? email;

  Errors({
    this.password,
    this.code,
    this.email,
  });

  Errors.fromJson(dynamic json) {
    password = json['password'] != null ? json['password'].cast<String>() : [];
    code = json['code'] != null ? json['code'].cast<String>() : [];
    email = json['email'] != null ? json['email'].cast<String>() : [];
  }

  Errors copyWith({
    List<String>? password,
    List<String>? code,
    List<String>? email,
  }) =>
      Errors(
        password: password ?? this.password,
        code: code ?? this.code,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password'] = password;
    map['code'] = code;
    map['email'] = email;
    return map;
  }
}
