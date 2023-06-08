import 'dart:convert';

class Comment {
  final String content;
  final String productId;
  final String image;
  final double rating;

  Comment({
    required this.content,
    required this.productId,
    required this.image,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'productId': productId,
      'image': image,
      'rating': rating,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      content: map['content'] as String,
      productId: map['productId'] as String,
      image: map['image'] as String,
      rating: map['rating'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  Comment copyWith({
    String? content,
    String? productId,
    String? image,
    double? rating,
  }) {
    return Comment(
      content: content ?? this.content,
      productId: productId ?? this.productId,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }
}
