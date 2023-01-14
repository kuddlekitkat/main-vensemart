class PostCancelBookingModel {
  int? status;
  String? message;
  Data? data;

  PostCancelBookingModel({this.status, this.message, this.data});

  PostCancelBookingModel.fromJson(Map<String, dynamic> json) {
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
  int? Id;
  String? cancelReason;
  String? bookingId;


  Data(
      {
        this.Id,
        this.cancelReason,
        this.bookingId,
      });

  Data.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    cancelReason = json['cancel_reason'];
    bookingId = json['booking_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = Id;
    data['cancel_reason'] = cancelReason;
    data['booking_id'] = bookingId;
    return data;
  }
}