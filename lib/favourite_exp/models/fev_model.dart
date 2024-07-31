import 'dart:convert';
import 'package:equatable/equatable.dart';

class FavouriteModel extends Equatable {
  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;
  const FavouriteModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite = false,
  });

  @override
  List<Object> get props => [id, value, isDeleting, isFavourite];

  FavouriteModel copyWith({
    String? id,
    String? value,
    bool? isDeleting,
    bool? isFavourite,
  }) {
    return FavouriteModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'value': value,
      'isDeleting': isDeleting,
      'isFavourite': isFavourite,
    };
  }

  factory FavouriteModel.fromMap(Map<String, dynamic> map) {
    return FavouriteModel(
      id: map['id'] as String,
      value: map['value'] as String,
      isDeleting: map['isDeleting'] as bool,
      isFavourite: map['isFavourite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavouriteModel.fromJson(String source) =>
      FavouriteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
