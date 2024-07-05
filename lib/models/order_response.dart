class DonationResponse {
  int? status;
  bool? success;
  int? length;
  String? message;
  List<Orders>? orders;

  DonationResponse(
      {this.status, this.success, this.length, this.message, this.orders});

  DonationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
    data['status'] = this.status;
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
  Image? image;
  int? ordercoins;
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
        this.image,
        this.ordercoins,
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
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    ordercoins = json['ordercoins'];
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
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['ordercoins'] = this.ordercoins;
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
