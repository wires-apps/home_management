import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_request_store_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServiceRequestStoreDto extends Equatable {
  const ServiceRequestStoreDto({
    this.photos,
    required this.type,
    required this.description,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<File>? photos;

  @JsonKey(name: 'type', required: true, includeIfNull: false)
  final String type;

  @JsonKey(name: 'description', required: true, includeIfNull: false)
  final String description;

  factory ServiceRequestStoreDto.fromJson(Map<String, dynamic> json) => _$ServiceRequestStoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceRequestStoreDtoToJson(this);

  @override
  List<Object?> get props => [
        photos,
        type,
        description,
      ];
}
