import 'dart:convert';

class Dog {
  String imageUrl;
  String status;
  Dog({
    required this.imageUrl,
    required this.status,
  });

  Dog copyWith({
    String? imageUrl,
    String? status,
  }) {
    return Dog(
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': imageUrl,
      'status': status,
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      imageUrl: map['message'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Dog.fromJson(String source) => Dog.fromMap(json.decode(source));

  @override
  String toString() => 'Dog(image: $imageUrl, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Dog && other.imageUrl == imageUrl && other.status == status;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ status.hashCode;
}
