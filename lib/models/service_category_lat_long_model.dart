class ServiceCategoryLatLongModel {
  int? status;
  String? message;
  List<Data>? data;

  ServiceCategoryLatLongModel({this.status, this.message, this.data});

  ServiceCategoryLatLongModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? id;
  String? serviceType;
  String? locationLat;
  String? locationLong;
  dynamic profile;
  String? categoryName;
  String? categoryIcon;
  String? location;
  String? serviceTypePrice;
  dynamic serviceProviderImage;
  String? distance;
  dynamic serviceCategory;
  dynamic serviceProviderRating;
  dynamic categoryId;


  Data(
      {
        this.name,
        this.id,
        this.serviceType,
        this.locationLat,
        this.locationLong,
        this.profile,
        this.categoryName,
        this.categoryIcon,
        this.location,
        this.serviceTypePrice,
       this.serviceProviderImage,
       this.distance,
       this.serviceCategory,
       this.serviceProviderRating,
       this.categoryId });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryIcon = json['category_icon'];
    categoryName = json['category_name'];
    serviceType = json['service_type'];
    locationLat = json['location_lat'];
    locationLong = json['location_long'];
    profile = json['profile'];
    categoryName = json['category_name'];
    categoryIcon = json['category_icon'];
    location = json['location'];
    serviceTypePrice = json['service_type_price'];
    serviceProviderImage =  json["service_provider_image"];
    distance =  json["distance"];
    serviceCategory =  json["service_category"];
    serviceProviderRating =  json["service_provider_rating"];



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_icon'] = categoryIcon;
    data['category_name'] = categoryName;
    data['service_type'] = serviceType;
    data['profile'] =  profile;
    data['category_name'] = categoryName;
    data['category_icon'] = categoryIcon;
    data['location'] =  location;
    data['service_type_price'] = serviceTypePrice;
    data['service_provider_image'] = serviceProviderImage;
    data['distance'] = distance;
    data['service_category'] = serviceCategory.toJson();
    data['service_provider_rating'] = serviceProviderRating;
    data['location_lat'] = locationLat;

    return data;
  }


}