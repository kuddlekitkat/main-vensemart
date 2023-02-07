class AddBookingModel {
  int? status;
  String? message;
  Data? data;

  AddBookingModel({this.status, this.message, this.data});

  AddBookingModel.fromJson(Map<String, dynamic> json) {
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
  int? serviceProviderId;
  String? bookingDate;
  String? bookingTime;

  Data({
    this.serviceProviderId,
    this.bookingDate,
    this.bookingTime,
  });

  Data.fromJson(Map<String, dynamic> json) {
    serviceProviderId = json['service_provider_id'];
    bookingTime = json['booking_time'];
    bookingDate = json['booking_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_provider_id'] = serviceProviderId;
    data['booking_time'] = bookingTime;
    data['booking_date'] = bookingDate;
    return data;
  }
}
