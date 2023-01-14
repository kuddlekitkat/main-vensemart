class AddProductToCartModel {
  int? status;
  String? message;
  Data? data;

  AddProductToCartModel({this.status, this.message, this.data});

  AddProductToCartModel.fromJson(Map<String, dynamic> json) {
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
  int? productId;
  String? categoryId;
  String? quantity;
  String? uomId;
  String? netAmount;
  String? discount;




  Data(
      {
        this.productId,
        this.categoryId,
        this.quantity,
        this.uomId,
        this.netAmount,
        this.discount,
      });

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['cat_id'];
    quantity = json['qty'];
    uomId = json['uom_id'];
    netAmount = json['net_amount'];
    discount = json['discount'];



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['cat_id'] = categoryId;
    data['qty'] = quantity;
    data['uom_id'] = uomId;
    data['net_worth'] = netAmount;
    data['discount'] = discount;
    return data;
  }
}