import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suggestion_store_request_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SuggestionStoreRequestDto extends Equatable {
  const SuggestionStoreRequestDto({
    this.photos,
    required this.message,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<File>? photos;

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  factory SuggestionStoreRequestDto.fromJson(Map<String, dynamic> json) => _$SuggestionStoreRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionStoreRequestDtoToJson(this);

  @override
  List<Object?> get props => [
        message,
        photos,
      ];
}
