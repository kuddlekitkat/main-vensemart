class ShopByIdModel {
  int? status;
  String? message;
  List<Data>? data;

  ShopByIdModel({this.status, this.message, this.data});

  ShopByIdModel.fromJson(Map<String, dynamic> json) {
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
  
  String? id;
  String? franchiseId;
  String? storeName;
  String? storeImage;
  String? address;
  String? lati;
  String? longi;
  String? status;
  String? createdAt;
  String? updatedAt;





  Data(
      {
        this.id,
        this.franchiseId,
        this.storeName,
        this.storeImage,
        this.address,
        this.lati,
        this.longi,
        this.status,
        this.createdAt,
        this.updatedAt,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    franchiseId = json['franchise_id'];
    storeName = json['store_name'];
    storeImage= json['store_image'];
    address = json['address'];
    lati = json['lati'];
    longi = json['longi'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt =  json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['franchise_id'] = franchiseId;
    data['store_name'] = storeName;
    data['store_image'] = storeImage;
    data['address'] = address;
    data['lati'] = lati;
    data['longi'] = longi;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}