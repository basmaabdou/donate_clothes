class OrderResponse {
  bool? success;
  int? length;
  String? message;
  List<Orders>? orders;

  OrderResponse({this.success, this.length, this.message, this.orders});

  OrderResponse.fromJson(Map<String, dynamic> json) {
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
  Charity? charity;
  int? quantity;
  int? phone;
  String? address;
  String? city;
  String? state;
  Photo? photo;
  String? status;
  int? iV;
  Userinfo? userinfo;

  Orders(
      {this.sId,
        this.itemsName,
        this.charity,
        this.quantity,
        this.phone,
        this.address,
        this.city,
        this.state,
        this.photo,
        this.status,
        this.iV,
        this.userinfo});

  Orders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    itemsName = json['itemsName'];
    charity =
    json['charity'] != null ? new Charity.fromJson(json['charity']) : null;
    quantity = json['quantity'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    status = json['status'];
    iV = json['__v'];
    userinfo = json['userinfo'] != null
        ? new Userinfo.fromJson(json['userinfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['itemsName'] = this.itemsName;
    if (this.charity != null) {
      data['charity'] = this.charity!.toJson();
    }
    data['quantity'] = this.quantity;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    if (this.photo != null) {
      data['photo'] = this.photo!.toJson();
    }
    data['status'] = this.status;
    data['__v'] = this.iV;
    if (this.userinfo != null) {
      data['userinfo'] = this.userinfo!.toJson();
    }
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

class Photo {
  String? url;
  Null? publicId;

  Photo({this.url, this.publicId});

  Photo.fromJson(Map<String, dynamic> json) {
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
  String? phone;
  int? coins;

  Userinfo({this.sId, this.username, this.phone, this.coins});

  Userinfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    phone = json['phone'];
    coins = json['coins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['coins'] = this.coins;
    return data;
  }
}
