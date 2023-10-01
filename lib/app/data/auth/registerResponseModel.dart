class RegisterResponseModel {
  Data? data;
  String? token;
  String? type;

  RegisterResponseModel({this.data, this.token, this.type});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['type'] = this.type;
    return data;
  }

  RegisterResponseModel copyWith({
    Data? data,
    String? token,
    String? type,
  }) {
    return RegisterResponseModel(
        data: data ?? this.data,
        token: token ?? this.token,
        type: type ?? this.type
    );
  }
}

class Data {
  String? name;
  String? email;
  String? phone;
  String? country;
  String? governrate;
  String? city;
  String? type;
  String? platform;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
        this.email,
        this.phone,
        this.country,
        this.governrate,
        this.city,
        this.type,
        this.platform,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    governrate = json['governrate'];
    city = json['city'];
    type = json['type'];
    platform = json['platform'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['governrate'] = this.governrate;
    data['city'] = this.city;
    data['type'] = this.type;
    data['platform'] = this.platform;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
