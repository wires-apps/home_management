import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_response_categories_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServiceResponseStoreItemDto extends Equatable {
  const ServiceResponseStoreItemDto({
    required this.id,
    required this.name,
    required this.nameRus,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: 'name_rus', required: true, includeIfNull: false)
  final String nameRus;

  @JsonKey(name: 'created_at', required: true, includeIfNull: false)
  final String? createdAt;

  @JsonKey(name: 'updated_at', required: true, includeIfNull: false)
  final String? updatedAt;

  factory ServiceResponseStoreItemDto.fromJson(Map<String, dynamic> json) => _$ServiceResponseStoreItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceResponseStoreItemDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        nameRus,
        createdAt,
        updatedAt,
      ];
}
