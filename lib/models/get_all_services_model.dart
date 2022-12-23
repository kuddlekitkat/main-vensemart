class ServiceCategoryModel {
  int? status;
  String? message;
  List<Data>? data;

  ServiceCategoryModel({this.status, this.message, this.data});

  ServiceCategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? categoryIcon;
  String? categoryName;
  String? createdAt;
  String? updatedAt;
  String? categoryId;

  Data(
      {this.id,
      this.categoryIcon,
      this.categoryName,
      this.createdAt,
      this.updatedAt,
      this.categoryId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryIcon = json['category_icon'];
    categoryName = json['category_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_icon'] = categoryIcon;
    data['category_name'] = categoryName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['category_id'] = categoryId;
    return data;
  }
}