class RateServiceProviderModel {
  int? status;
  String? message;
  Data? data;

  RateServiceProviderModel({this.status, this.message, this.data});

  RateServiceProviderModel.fromJson(Map<String, dynamic> json) {
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
  int? rating;
  String? bookingId;


  Data(
      {
        this.rating,
        this.bookingId,
      });

  Data.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    bookingId = json['booking_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booking_id'] = bookingId;
    data['rating'] = rating;
    return data;
  }
}