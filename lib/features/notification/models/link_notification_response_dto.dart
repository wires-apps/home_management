import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'link_notification_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LinkNotificationResponseDto extends Equatable {
  const LinkNotificationResponseDto({
    required this.url,
    required this.label,
    required this.isActive,
  });

  @JsonKey(name: 'url', required: false, includeIfNull: false)
  final String? url;

  @JsonKey(name: 'label', required: true, includeIfNull: false)
  final String label;

  @JsonKey(name: 'active', required: true, includeIfNull: false)
  final bool isActive;

  factory LinkNotificationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LinkNotificationResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LinkNotificationResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        url,
        label,
        isActive,
      ];
}
