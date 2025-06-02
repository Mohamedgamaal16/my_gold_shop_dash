class BannerModel {
  final String id;
  final String merchantName;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const BannerModel({
    required this.id,
    required this.merchantName,
    required this.imageUrl,
    required this.createdAt,
    this.updatedAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] ?? '',
      merchantName: json['merchantName'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null 
          ? DateTime.parse(json['updatedAt']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'merchantName': merchantName,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  BannerModel copyWith({
    String? id,
    String? merchantName,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BannerModel(
      id: id ?? this.id,
      merchantName: merchantName ?? this.merchantName,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BannerModel &&
        other.id == id &&
        other.merchantName == merchantName &&
        other.imageUrl == imageUrl &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        merchantName.hashCode ^
        imageUrl.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  String toString() {
    return 'BannerModel(id: $id, merchantName: $merchantName, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}