class DonationResponse {
  bool? success;
  int? length;
  String? message;
  List<Orders>? orders;

  DonationResponse({this.success, this.length, this.message, this.orders});

  DonationResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    length = json['length'];
    message = json['message'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['length'] = this.length;
    data['message'] = this.message;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String? sId;
  String? itemsName;
  String? location;
  Charity? charity;
  int? quantity;
  int? phone;
  String? status;
  Userinfo? userinfo;
  int? iV;

  Orders(
      {this.sId,
        this.itemsName,
        this.location,
        this.charity,
        this.quantity,
        this.phone,
        this.status,
        this.userinfo,
        this.iV});

  Orders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    itemsName = json['itemsName'];
    location = json['location'];
    charity =
    json['charity'] != null ? new Charity.fromJson(json['charity']) : null;
    quantity = json['quantity'];
    phone = json['phone'];
    status = json['status'];
    userinfo = json['userinfo'] != null
        ? new Userinfo.fromJson(json['userinfo'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['itemsName'] = this.itemsName;
    data['location'] = this.location;
    if (this.charity != null) {
      data['charity'] = this.charity!.toJson();
    }
    data['quantity'] = this.quantity;
    data['phone'] = this.phone;
    data['status'] = this.status;
    if (this.userinfo != null) {
      data['userinfo'] = this.userinfo!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Charity {
  String? sId;
  String? title;

  Charity({this.sId, this.title});

  Charity.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}

class Userinfo {
  String? sId;
  String? username;

  Userinfo({this.sId, this.username});

  Userinfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    return data;
  }
}