class MovieModel {
  double? score;
  Show? show;

  MovieModel({this.score, this.show});

  MovieModel.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    show = json['show'] != null ? new Show.fromJson(json['show']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    if (this.show != null) {
      data['show'] = this.show!.toJson();
    }
    return data;
  }
}

class Show {
  int? id;
  String? name;
  String? language;
  List<String>? genres;
  Image? image;
  String? summary;

  Show({
    this.id,
    this.name,
    this.language,
    this.genres,
    this.image,
    this.summary,
  });

  Show.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    language = json['language'];
    genres = json['genres'].cast<String>();
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['language'] = this.language;
    data['genres'] = this.genres;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    } else {
      data["image"] =
          "https://e7.pngegg.com/pngimages/829/733/png-clipart-logo-brand-product-trademark-font-not-found-logo-brand.png";
    }
    data['summary'] = this.summary;
    return data;
  }
}

class Network {
  int? id;
  String? name;
  String? officialSite;
  Network({this.id, this.name, this.officialSite});
  Network.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['officialSite'] = this.officialSite;
    return data;
  }
}

class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'] ??
        "https://e7.pngegg.com/pngimages/829/733/png-clipart-logo-brand-product-trademark-font-not-found-logo-brand.png";
    original = json['original'] ??
        "https://e7.pngegg.com/pngimages/829/733/png-clipart-logo-brand-product-trademark-font-not-found-logo-brand.png";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium ??
        "https://e7.pngegg.com/pngimages/829/733/png-clipart-logo-brand-product-trademark-font-not-found-logo-brand.png";
    data['original'] = this.original ??
        "https://e7.pngegg.com/pngimages/829/733/png-clipart-logo-brand-product-trademark-font-not-found-logo-brand.png";
    return data;
  }
}
