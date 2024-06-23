class EditProfileResponse {
  bool? success;
  String? message;
  Data? data;

  EditProfileResponse({this.success, this.message, this.data});

  EditProfileResponse.fromJson(Map<String, dynamic> json) {
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
  String? password;
  String? confirmPassword;
  Profilephoto? profilephoto;
  String? role;
  int? coins;
  bool? isAccountVerified;
  List<Null>? orders;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.username,
      this.email,
      this.phone,
      this.password,
      this.confirmPassword,
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
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    profilephoto = json['profilephoto'] != null
        ? new Profilephoto.fromJson(json['profilephoto'])
        : null;
    role = json['role'];
    coins = json['coins'];
    isAccountVerified = json['isAccountVerified'];
    // if (json['orders'] != null) {
    //   orders = <Null>[];
    //   json['orders'].forEach((v) {
    //     orders!.add(new Null.fromJson(v));
    //   });
    // }
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
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    if (this.profilephoto != null) {
      data['profilephoto'] = this.profilephoto!.toJson();
    }
    data['role'] = this.role;
    data['coins'] = this.coins;
    data['isAccountVerified'] = this.isAccountVerified;
    // if (this.orders != null) {
    //   data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    // }
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
