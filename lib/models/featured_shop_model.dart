class FeaturedShopModel {
  int? status;
  String? message;
  List<Data>? data;

  FeaturedShopModel({this.status, this.message, this.data});

  FeaturedShopModel.fromJson(Map<String, dynamic> json) {
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
  dynamic id;
  String? franchiseId;
  String? storeName;
  String? storeImage;
  String? Address;
  String? Latitude;
  String? Longitude;
  String? status;
  String? createdAt;
  String? updatedAt;


  Data(
      {
        this.id,
        this.franchiseId,
        this.storeName,
        this.storeImage,
        this.Address,
        this.Latitude,
        this.Longitude,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    franchiseId = json['franchise_id'];
    storeImage = json['store_image'];
    storeName = json['store_name'];
    Address = json['address'];
    Latitude = json['lati'];
    Longitude = json['longi'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['franchise_id'] = franchiseId;
    data['store_name'] = storeName;
    data['store_image'] = storeImage;
    data['address'] = Address;
    data['lati'] = Latitude;
    data['longi'] = Longitude;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    return data;
  }
}