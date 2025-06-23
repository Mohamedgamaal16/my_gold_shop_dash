class Location {
  Location({
      this.lat, 
      this.long,});

  Location.fromJson(dynamic json) {
    lat = json['lat'];
    long = json['long'];
  }
  num? lat;
  num? long;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['long'] = long;
    return map;
  }

}