class CreateOrder {
  bool? success;
  String? message;
  Data? data;

  CreateOrder({this.success, this.message, this.data});

  CreateOrder.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['userinfo'] = this.userinfo;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
