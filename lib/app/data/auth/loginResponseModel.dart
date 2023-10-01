class LoginResponseModel {
  LoginResponseModel({
    this.data,
    this.token,
    this.type,
  });

  LoginResponseModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
    type = json['type'];
  }

  Data? data;
  String? token;
  String? type;

  LoginResponseModel copyWith({
    Data? data,
    String? token,
    String? type,
  }) =>
      LoginResponseModel(
        data: data ?? this.data,
        token: token ?? this.token,
        type: type ?? this.type,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    map['type'] = type;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.country,
    this.governrate,
    this.city,
    this.type,
    this.platform,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    country = json['country'];
    governrate = json['governrate'];
    city = json['city'];
    type = json['type'];
    platform = json['platform'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? phone;
  String? country;
  String? governrate;
  String? city;
  String? type;
  String? platform;
  String? createdAt;
  String? updatedAt;

  Data copyWith({
    num? id,
    String? name,
    String? email,
    dynamic emailVerifiedAt,
    String? phone,
    String? country,
    String? governrate,
    String? city,
    String? type,
    String? platform,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        phone: phone ?? this.phone,
        country: country ?? this.country,
        governrate: governrate ?? this.governrate,
        city: city ?? this.city,
        type: type ?? this.type,
        platform: platform ?? this.platform,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['phone'] = phone;
    map['country'] = country;
    map['governrate'] = governrate;
    map['city'] = city;
    map['type'] = type;
    map['platform'] = platform;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
