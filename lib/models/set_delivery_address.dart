class SetDeliveryAddressModel {
  int? status;
  String? message;
  Data? data;

  SetDeliveryAddressModel({this.status, this.message, this.data});

  SetDeliveryAddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {

  String? type;
  String? address;
  String? locality;
  String? city;
  String? state;




  Data(
      {
        this.type,
        this.address,
        this.locality,
        this.city,
        this.state,
      });

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    address = json['address'];
    locality = json['locality'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['address'] = address;
    data['locality'] = locality;
    data['city'] = city;
    data['state'] = state;
    return data;
  }
}