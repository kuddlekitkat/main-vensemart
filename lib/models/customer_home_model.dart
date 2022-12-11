class CustomerHomeModel {
  int? status;
  String? message;
  Data? data;

  CustomerHomeModel({this.status, this.message, this.data});

  CustomerHomeModel.fromJson(Map<String, dynamic> json) {
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
  List<BannerList>? bannerList;
  List<TodayDiscount>? todayDiscount;
  List<Supermarket>? supermarket;
  List<dynamic>? trandingList;

  Data(
      {this.bannerList,
      this.todayDiscount,
      this.supermarket,
      this.trandingList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banner_list'] != null) {
      bannerList = <BannerList>[];
      json['banner_list'].forEach((v) {
        bannerList!.add(BannerList.fromJson(v));
      });
    }
    if (json['today_discount'] != null) {
      todayDiscount = <TodayDiscount>[];
      json['today_discount'].forEach((v) {
        todayDiscount!.add(TodayDiscount.fromJson(v));
      });
    }
    if (json['supermarket'] != null) {
      supermarket = <Supermarket>[];
      json['supermarket'].forEach((v) {
        supermarket!.add(Supermarket.fromJson(v));
      });
    }
    if (json['tranding_list'] != null) {
      trandingList = <Null>[];
      json['tranding_list'].forEach((v) {
        trandingList!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bannerList != null) {
      data['banner_list'] = bannerList!.map((v) => v.toJson()).toList();
    }
    if (todayDiscount != null) {
      data['today_discount'] =
          todayDiscount!.map((v) => v.toJson()).toList();
    }
    if (supermarket != null) {
      data['supermarket'] = supermarket!.map((v) => v.toJson()).toList();
    }
    if (trandingList != null) {
      data['tranding_list'] =
          trandingList!.map((v) => v).toList();
    }
    return data;
  }
}

class BannerList {
  String? id;
  String? bannerImage;
  String? status;
  String? createdAt;
  String? updatedAt;

  BannerList(
      {this.id, this.bannerImage, this.status, this.createdAt, this.updatedAt});

  BannerList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerImage = json['banner_image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['banner_image'] = bannerImage;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class TodayDiscount {
  String? id;
  String? title;
  String? description;
  String? offerPercentage;
  String? offerBanner;
  String? status;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  TodayDiscount(
      {this.id,
      this.title,
      this.description,
      this.offerPercentage,
      this.offerBanner,
      this.status,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt});

  TodayDiscount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    offerPercentage = json['offer_percentage'];
    offerBanner = json['offer_banner'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['offer_percentage'] = offerPercentage;
    data['offer_banner'] = offerBanner;
    data['status'] = status;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Supermarket {
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
  String? distance;

  Supermarket(
      {this.id,
      this.franchiseId,
      this.storeName,
      this.storeImage,
      this.address,
      this.lati,
      this.longi,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.distance});

  Supermarket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    franchiseId = json['franchise_id'];
    storeName = json['store_name'];
    storeImage = json['store_image'];
    address = json['address'];
    lati = json['lati'];
    longi = json['longi'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    distance = json['distance'];
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
    data['distance'] = distance;
    return data;
  }
}