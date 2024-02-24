class ProfileResponse {
  int? success;
  String? message;
  Data? data;

  ProfileResponse({this.success, this.message, this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? username;
  String? email;
  String? phone;
  Profilephoto? profilephoto;
  String? role;
  int? coins;
  bool? isAccountVerified;
  List<Orders>? orders;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.username,
        this.email,
        this.phone,
        this.profilephoto,
        this.role,
        this.coins,
        this.isAccountVerified,
        this.orders,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    profilephoto = json['profilephoto'] != null
        ? new Profilephoto.fromJson(json['profilephoto'])
        : null;
    role = json['role'];
    coins = json['coins'];
    isAccountVerified = json['isAccountVerified'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.profilephoto != null) {
      data['profilephoto'] = this.profilephoto!.toJson();
    }
    data['role'] = this.role;
    data['coins'] = this.coins;
    data['isAccountVerified'] = this.isAccountVerified;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Profilephoto {
  String? url;
  Null? publicId;

  Profilephoto({this.url, this.publicId});

  Profilephoto.fromJson(Map<String, dynamic> json) {
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

class Orders {
  String? sId;
  String? itemsName;
  Charity? charity;
  int? quantity;
  int? phone;
  String? address;
  String? city;
  String? state;
  Profilephoto? photo;
  String? status;
  String? userinfo;
  int? iV;

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
        this.userinfo,
        this.iV});

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
    photo =
    json['photo'] != null ? new Profilephoto.fromJson(json['photo']) : null;
    status = json['status'];
    userinfo = json['userinfo'];
    iV = json['__v'];
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
    data['userinfo'] = this.userinfo;
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
