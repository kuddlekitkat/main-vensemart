class SuggestedProductModel {
  int? status;
  String? message;
  Data? data;

  SuggestedProductModel({this.status, this.message, this.data});

  SuggestedProductModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? shopId;
  String? categoryId;
  String? subCatId;
  String? productTitle;
  String? productDescription;
  String? productImage;
  String? productPrice;
  String? discount;
  String? quantity;
  String? uomId;
  String? inStock;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imagename;
  String? storeName;
  String? uomName;

  Data(
      {this.id,
      this.shopId,
      this.categoryId,
      this.subCatId,
      this.productTitle,
      this.productDescription,
      this.productImage,
      this.productPrice,
      this.discount,
      this.quantity,
      this.uomId,
      this.inStock,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.imagename,
      this.storeName,
      this.uomName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    categoryId = json['category_id'];
    subCatId = json['sub_cat_id'];
    productTitle = json['product_title'];
    productDescription = json['product_Description'];
    productImage = json['product_image'];
    productPrice = json['product_price'];
    discount = json['discount'];
    quantity = json['quantity'];
    uomId = json['uom_id'];
    inStock = json['in_stock'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagename = json['imagename'];
    storeName = json['store_name'];
    uomName = json['uom_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shop_id'] = shopId;
    data['category_id'] = categoryId;
    data['sub_cat_id'] = subCatId;
    data['product_title'] = productTitle;
    data['product_Description'] = productDescription;
    data['product_image'] = productImage;
    data['product_price'] = productPrice;
    data['discount'] = discount;
    data['quantity'] = quantity;
    data['uom_id'] = uomId;
    data['in_stock'] = inStock;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['imagename'] = imagename;
    data['store_name'] = storeName;
    data['uom_name'] = uomName;
    return data;
  }
}
