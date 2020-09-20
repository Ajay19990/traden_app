class Service {
  int id;
  String name;
  String providerName;
  String providerFirstName;
  int cat;
  String shortDescription;
  int rating;
  String createdAt;
  String lat;
  String lon;

  Service({
    this.id,
    this.name,
    this.providerName,
    this.providerFirstName,
    this.cat,
    this.shortDescription,
    this.rating,
    this.createdAt,
    this.lat,
    this.lon,
  });

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    providerName = json['providerName'];
    providerFirstName = json['providerFirstName'];
    cat = json['cat'];
    shortDescription = json['short_description'];
    rating = json['rating'];
    createdAt = json['created_at'];
    lat = json['lat'];
    lon = json['lon'];
  }
}
