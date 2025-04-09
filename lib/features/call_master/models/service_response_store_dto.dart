import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_response_store_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServiceResponseStoreDto extends Equatable {
  const ServiceResponseStoreDto({
    required this.id,
    required this.userId,
    required this.type,
    required this.description,
    this.updatedAt,
    this.createdAt,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'type', required: true, includeIfNull: false)
  final String type;

  @JsonKey(name: 'user_id', required: true, includeIfNull: false)
  final int userId;

  @JsonKey(name: 'description', required: true, includeIfNull: false)
  final String description;

  @JsonKey(name: 'updated_at', required: true, includeIfNull: false)
  final String? updatedAt;

  @JsonKey(name: 'created_at', required: true, includeIfNull: false)
  final String? createdAt;

  factory ServiceResponseStoreDto.fromJson(Map<String, dynamic> json) => _$ServiceResponseStoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceResponseStoreDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        userId,
        updatedAt,
        createdAt,
        type,
        description,
      ];
}
