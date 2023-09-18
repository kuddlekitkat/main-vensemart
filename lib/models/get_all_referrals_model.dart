class ReferralsModel {
  dynamic status;
  dynamic message;
  Data? data;

  ReferralsModel({this.status, this.message, this.data});

  ReferralsModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? email;
  String? referral_code;
  List<dynamic>? referrals;

  Data({this.id, this.name, this.email, this.referrals,this.referral_code});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    referral_code = json['referral_code'];
    if (json['referrals'] != null) {
      referrals = <dynamic>[];
      json['referrals'].forEach((v) {
        referrals?.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['referral_code'] = referral_code;
    data['referrals'] = referrals;

    return data;
  }
}

