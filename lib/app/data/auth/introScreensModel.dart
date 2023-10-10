/// status : true
/// screens : [{"title":"Join an Innovative Engineering Community!","description":"Welcome to the Engineering Community App! Join our community and connect with professional engineers.","image":"assets/website/images/svg/process-1.svg"},{"title":"Unlimited Possibilities","description":"Unlock Unlimited Possibilities! Explore offers and seize multiple engineering opportunities.","image":"assets/website/images/svg/process-2.svg"},{"title":"Innovative Engineering Community","description":"Join an Innovative Engineering Community! Share ideas and contribute to shaping the future of engineering.","image":"assets/website/images/svg/process-3.svg"}]

class IntroScreensModel {
  IntroScreensModel({
    this.status,
    this.screens,
  });

  IntroScreensModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['screens'] != null) {
      screens = [];
      json['screens'].forEach((v) {
        screens?.add(Screens.fromJson(v));
      });
    }
  }

  bool? status;
  List<Screens>? screens;

  IntroScreensModel copyWith({
    bool? status,
    List<Screens>? screens,
  }) =>
      IntroScreensModel(
        status: status ?? this.status,
        screens: screens ?? this.screens,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (screens != null) {
      map['screens'] = screens?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// title : "Join an Innovative Engineering Community!"
/// description : "Welcome to the Engineering Community App! Join our community and connect with professional engineers."
/// image : "assets/website/images/svg/process-1.svg"

class Screens {
  Screens({
    this.title,
    this.description,
    this.image,
  });

  Screens.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }

  String? title;
  String? description;
  String? image;

  Screens copyWith({
    String? title,
    String? description,
    String? image,
  }) =>
      Screens(
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['image'] = image;
    return map;
  }
}
