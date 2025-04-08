import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complaint_store_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ComplaintStoreResponseDto extends Equatable {
  const ComplaintStoreResponseDto({
    required this.id,
    required this.userId,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  @JsonKey(name: 'user_id', required: true, includeIfNull: false)
  final int userId;

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  @JsonKey(name: 'created_at', required: true, includeIfNull: false)
  final String createdAt;

  @JsonKey(name: 'updated_at', required: true, includeIfNull: false)
  final String updatedAt;

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  factory ComplaintStoreResponseDto.fromJson(Map<String, dynamic> json) => _$ComplaintStoreResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintStoreResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        userId,
        message,
        createdAt,
        updatedAt,
      ];
}
