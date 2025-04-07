import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_service_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotificationServiceResponseDto extends Equatable {
  const NotificationServiceResponseDto({
    required this.message,
  });

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  factory NotificationServiceResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationServiceResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationServiceResponseDtoToJson(this);

  @override
  List<Object?> get props => [message];
}
