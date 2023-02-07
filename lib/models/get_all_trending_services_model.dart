class TrendingServiceModel {
  int? status;
  String? message;
  List<Data>? data;

  TrendingServiceModel({this.status, this.message, this.data});

  TrendingServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {

  dynamic name;
  dynamic id;
  dynamic state;
  dynamic serviceType;
  dynamic locationLat;
  dynamic locationLong;
  dynamic profile;
  dynamic categoryName;
  dynamic categoryIcon;
  dynamic location;
  dynamic serviceTypePrice;

  Data(
      {
        this.name,
        this.id,
        this.state,
        this.serviceType,
        this.locationLat,
        this.locationLong,
        this.profile,
        this.categoryName,
        this.categoryIcon,
        this.location,
        this.serviceTypePrice,});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    state = json['state'];
    serviceType = json['service_type'];
    locationLat = json['location_lat'];
    locationLong = json['location_long'];
    profile = json['profile'];
    categoryName = json['category_name'];
    categoryIcon = json['category_icon'];
    location = json['location'];
    serviceTypePrice = json['service_type_price'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['state'] = state;
    data['service_type'] = serviceType;
    data['location_lat'] = locationLat;
    data['location_long'] = locationLong;
    data['profile'] = profile;
    data['category_icon'] = categoryIcon;
    data['category_name'] = categoryName;
    data['location'] = location;
    data['service_type_price'] = serviceTypePrice;
    return data;
  }
}