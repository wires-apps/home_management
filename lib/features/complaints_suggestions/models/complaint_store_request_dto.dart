import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complaint_store_request_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ComplaintStoreRequestDto extends Equatable {
  const ComplaintStoreRequestDto({
    this.photos,
    required this.message,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<File?>? photos;

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  factory ComplaintStoreRequestDto.fromJson(Map<String, dynamic> json) => _$ComplaintStoreRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintStoreRequestDtoToJson(this);

  @override
  List<Object?> get props => [
        message,
        photos,
      ];
}
