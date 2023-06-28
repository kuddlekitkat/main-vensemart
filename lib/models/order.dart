class OrderModel {
  int? status;
  String? message;
  List<Data>? data;

  OrderModel({this.status, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[] ;
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

  dynamic id;
  String? status;
  String? createdAt;
  String? updatedAt;
  dynamic orderId;
  dynamic netAmount;
  dynamic taxes;
  dynamic deliveryCharge;
  dynamic totalAmount;
  dynamic totalItem;
  String? paymentStatus;
  dynamic paymentType;
  dynamic transactionId;
  dynamic invoiceId;
  dynamic purchaseDate;



  // "order_id": "FM23051",
  // "net_amount": 25,
  // "taxes": 1.88,
  // "delivery_charge": 500,
  // "total_amount": 526.88,
  // "total_item": 1,
  // "status": "2",
  // "payment_type": "",
  // "payment_status": "1",
  // "transaction_id": "822365794705",
  // "invoice_no": "776772553855",
  // "purchase_date": "2023-04-25",
  // "created_at": "2023-04-25 13:01:34",
  // "updated_at": "2023-04-25 13:01:34",

  List<ProductList>? productList;

  Data(
      {
        this.id,this.status, this.netAmount,
        this.updatedAt, this.createdAt, this.transactionId,
        this.purchaseDate, this.deliveryCharge,
        this.invoiceId,this.orderId, this.paymentStatus,
        this.paymentType, this.taxes, this.totalAmount,this.totalItem,
        this.productList,
      });

  Data.fromJson(Map<String, dynamic> json) {
    // https://api.vensemart.com/storage/product_images/
    id = json['id'];
    netAmount = json['net_amount'];
    transactionId = json['transaction_id'];
    purchaseDate = json['purchase_date'];
    deliveryCharge = json['delivery_charge'];
    invoiceId = json['invoice_id'];
    orderId = json['order_id'];
    paymentType = json['payment_type'];
    paymentStatus = json['payment_status'];
    taxes = json['taxes'];
    totalAmount = json['total_amount'];
    totalItem = json['total_item'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      productList = <ProductList>[];
      json['products'].forEach((v) {
        productList!.add(ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['net_amount'] = netAmount;
    data['transaction_id'] = transactionId;
    data['purchase_date'] = purchaseDate;
    data['delivery_charge'] = deliveryCharge;
    data['invoice_id'] = invoiceId;
    data['order_id'] = orderId;
    data['payment_type'] = paymentType;
    data['payment_status'] = paymentStatus;
    data['taxes'] = taxes;
    data['total_item'] = totalAmount;
    data['total_item'] = totalItem;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    if (productList != null) {
      data['products'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList {

  // "id": 300,
  // "product_id": "3",
  // "order_id": "FM23051",
  // "invoice_number": "776772553855",
  // "product_name": "Tomato",
  // "user_id": "976",
  // "quantity": "1",
  // "net_price": "25",
  // "price": null,
  // "gst": null,
  // "gst_percent": "0",
  // "tax": "0",
  // "seller_id": null,
  // "basic_dp": "24.75",
  // "dp": "24.75",
  // "p_image": "tomato.jpeg",
  // "pay_mode": "CARD",
  // "uom_id": "3",
  // "purchase_date": "2023-04-25",
  // "created_at": "2023-04-25T13:01:34.000000Z",
  // "updated_at": "2023-04-25T13:01:34.000000Z"

  dynamic id;
  dynamic productId;
  dynamic categoryId;
  dynamic quantity;
  dynamic netAmount;
  dynamic afterDiscountAmount;
  String? productPrice;
  String? productName;
  String? productImage;
  dynamic shopId;
  String? productDescription;
  dynamic discount;
  String? categoryName;
  String? storeName;
  String? imageName;
  String? createdAt;
  String? updatedAt;



  ProductList(
      {
        this.id,
        this.productId,
        this.categoryId,
        this.quantity,
        this.netAmount,
        this.afterDiscountAmount,
        this.productImage,
        this.createdAt,
        this.updatedAt,
        this.shopId,
        this.productDescription,
        this.productName,
        this.discount,
        this.categoryName,
        this.storeName,
        this.imageName,
        this.productPrice



      });

  ProductList.fromJson(Map<String, dynamic> json) {



    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    categoryId = json['category_id'];
    quantity = json['qty'];
    netAmount = json['net_price'];
    afterDiscountAmount = json['after_discount_amount'];
    productImage = json['product_image'];
    productPrice = json['product_price'];
    shopId = json['shop_id'];
    productDescription = json['product_description'];
    discount = json['discount'];
    categoryName = json['category_name'];
    storeName = json['store_name'];
    imageName = json['p_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['category_id'] = categoryId;
    data['qty'] = quantity;
    data['net_price'] = netAmount;
    data['after_discount_amount'] = afterDiscountAmount;
    data['product_image'] = productImage;
    data['shop_id'] = shopId;
    data['product_description'] = productDescription;
    data['discount'] = discount;
    data['category_name'] = categoryName;
    data['store_name'] = storeName;
    data['image_name'] = imageName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}


class OrderDetails {

  dynamic subtotal;
  dynamic delivery_charge;
  dynamic grand_total;


  OrderDetails(
      {
        this.subtotal,
        this.delivery_charge,
        this.grand_total,
      });

  OrderDetails.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'];
    delivery_charge = json['delivery_charge'];
    grand_total = json['grand_total'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subtotal'] = subtotal;
    data['delivery_charge'] = delivery_charge;
    data['grand_total'] = grand_total;
    return data;
  }
}



