class OrganizationResponse {
  bool? success;
  String? message;
  int? length;
  List<AllOrganizaions>? allOrganizaions;

  OrganizationResponse(
      {this.success, this.message, this.length, this.allOrganizaions});

  OrganizationResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    length = json['length'];
    if (json['allOrganizaions'] != null) {
      allOrganizaions = <AllOrganizaions>[];
      json['allOrganizaions'].forEach((v) {
        allOrganizaions!.add(new AllOrganizaions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['length'] = this.length;
    if (this.allOrganizaions != null) {
      data['allOrganizaions'] =
          this.allOrganizaions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllOrganizaions {
  String? sId;
  String? title;
  List<Images>? images;
  String? organizationInfo;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AllOrganizaions(
      {this.sId,
        this.title,
        this.images,
        this.organizationInfo,
        this.createdAt,
        this.updatedAt,
        this.iV});

  AllOrganizaions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    organizationInfo = json['organizationInfo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['organizationInfo'] = this.organizationInfo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Images {
  String? url;
  String? publicId;
  String? sId;

  Images({this.url, this.publicId, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publicId = json['publicId'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['publicId'] = this.publicId;
    data['_id'] = this.sId;
    return data;
  }
}
