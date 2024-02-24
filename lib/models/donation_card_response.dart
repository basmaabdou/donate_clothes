class DonationCardResponse {
  bool? success;
  String? message;
  int? length;
  List<Data>? data;

  DonationCardResponse({this.success, this.message, this.length, this.data});

  DonationCardResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    length = json['length'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['length'] = this.length;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? description;
  String? info;
  String? earning;
  Image? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.title,
        this.description,
        this.info,
        this.earning,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    info = json['info'];
    earning = json['earning'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['info'] = this.info;
    data['earning'] = this.earning;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
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
