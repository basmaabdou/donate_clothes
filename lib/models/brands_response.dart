class BrandsResponse {
  bool? success;
  String? message;
  int? length;
  List<Brands>? brands;

  BrandsResponse({this.success, this.message, this.length, this.brands});

  BrandsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    length = json['length'];
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['length'] = this.length;
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  String? sId;
  String? title;
  Image? image;
  String? info;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Brands(
      {this.sId,
        this.title,
        this.image,
        this.info,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Brands.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    info = json['info'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['info'] = this.info;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
