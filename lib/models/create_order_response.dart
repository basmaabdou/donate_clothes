class CreateOrder {
  int? status;
  bool? success;
  String? message;
  Data? data;

  CreateOrder({this.status, this.success, this.message, this.data});

  CreateOrder.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? itemsName;
  String? location;
  String? charity;
  int? quantity;
  int? phone;
  String? status;
  Image? image;
  int? ordercoins;
  String? userinfo;
  String? sId;
  int? iV;

  Data(
      {this.itemsName,
        this.location,
        this.charity,
        this.quantity,
        this.phone,
        this.status,
        this.image,
        this.ordercoins,
        this.userinfo,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    itemsName = json['itemsName'];
    location = json['location'];
    charity = json['charity'];
    quantity = json['quantity'];
    phone = json['phone'];
    status = json['status'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    ordercoins = json['ordercoins'];
    userinfo = json['userinfo'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsName'] = this.itemsName;
    data['location'] = this.location;
    data['charity'] = this.charity;
    data['quantity'] = this.quantity;
    data['phone'] = this.phone;
    data['status'] = this.status;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['ordercoins'] = this.ordercoins;
    data['userinfo'] = this.userinfo;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class Image {
  String? url;
  String? publicId;

  Image({this.url, this.publicId});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publicId = json['publicId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['publicId'] = this.publicId;
    return data;
  }
}
